# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

# You can import any python module as needed.
import os
# Git Annex Imports
import ranger.api
#import ranger.api.commands

import subprocess
import tempfile
import json

# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!


class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()

# Git Annex Commands
class utils():
    def probably_not_indexed(self, f, fname):
        # let's check if the file is indexed
        o = subprocess.check_output([
            'git-annex', 'status', f.path, '--json'
        ])
        try:
            status = json.loads(o)['status']
            if status == '?':
                self.fm.notify(
                    "'{}' is not indexed or was renamed. "
                    "You must commit the changes.".format(fname)
                    .encode('utf-8')
                )
                return
        except ValueError:
            self.fm.notify(
                "'{}' is probably not indexed.".format(fname)
                .encode('utf-8')
            )
            return


class ga_tag(ranger.api.commands.Command):
    """:ga_tag <tagname> [tagname...]

    Tags the current file with git-annex metadata.
    """

    def execute(self):
        if not self.arg(1):
            return

        for f in self.fm.thistab.get_selection():
            for tag in self.args[1:]:
                subprocess.check_output([
                    'git-annex', 'metadata', '-t', tag, f.path])

        self.fm.notify('tagged in git-annex!')
        # self.fm.reload_cwd()


class ga_set(ranger.api.commands.Command):
    """:ga_set <key>=<value> [<key>=<value>...]

    Sets the metadata key-value pair in git-annex for the current file.
    "=" can be "+=", "-=" or "?=".
    """

    def execute(self):
        if not self.arg(1):
            return

        for f in self.fm.thistab.get_selection():
            for pair in self.args[1:]:
                if '=' not in pair:
                    continue

                subprocess.check_output([
                    'git-annex', 'metadata', '-s', pair, f.path])

        self.fm.notify('set in git-annex!')
        # self.fm.reload_cwd()


class ga_whereis(ranger.api.commands.Command):
    """:ga_whereis

    Shows in which other git-annex repos the current file is.
    Doesn't show the present repo, since it should be clear from ranger.
    """

    def execute(self):
        f = self.fm.thisfile
        o = subprocess.check_output([
            'git-annex', 'whereis', f.path, '--json'])

        data = json.loads(o)
        places = data['whereis'] + data['untrusted']

        repos = []
        for repo in places:
            if not repo['here']:
                spl = repo['description'].split('[')
                name = spl[-1][:-1] if len(spl) > 1 else repo['description']
                repos.append(name)

        self.fm.notify(' | '.join(repos))


class ga_get(ranger.api.commands.Command, utils):
    """:ga_get

    Fetches current file from a different git-annex remote (or special remote).
    """

    def execute(self):
        for f in self.fm.thistab.get_selection():
            fname = f.basename.decode('utf-8')
            self.fm.notify(
                u"fetching'{}'...".format(fname).encode('utf-8')
            )
            try:
                o = subprocess.check_output([
                    'git-annex', 'get', f.path, '--json'])
            except subprocess.CalledProcessError as e:
                self.fm.notify(e.output, bad=True)
                continue

            try:
                data = json.loads(o)
                if data['success']:
                    self.fm.notify(
                        u"'{}' fetched successfully.".format(fname)
                        .encode('utf-8')
                    )
                else:
                    self.fm.notify(o.encode('utf-8'), bad=True)
            except ValueError:
                if self.probably_not_indexed(f, fname):
                    continue

                self.fm.notify('error: ' + repr(o), bad=True)

        self.fm.reload_cwd()


class ga_drop(ranger.api.commands.Command, utils):
    """:ga_drop

    Drops current file from this git-annex repository here
    (as long as it is present in <numcopies> other repositories).
    """

    def execute(self):
        for f in self.fm.thistab.get_selection():
            fname = f.basename.decode('utf-8')

            self.fm.notify(
                u"dropping '{}'...".format(fname).encode('utf-8')
            )
            try:
                o = subprocess.check_output([
                    'git-annex', 'drop', f.path, '--json'
                ])
            except subprocess.CalledProcessError as e:
                self.fm.notify(e.output, bad=True)
                continue

            try:
                data = json.loads(o)
                if data['success']:
                    self.fm.notify(
                        u"'{}' dropped successfully.".format(fname)
                        .encode('utf-8')
                    )
                else:
                    self.fm.notify(o.encode('utf-8'), bad=True)
            except ValueError:
                if self.probably_not_indexed(f, fname):
                    continue

                self.fm.notify('error: ' + repr(o), bad=True)

        self.fm.reload_cwd()
