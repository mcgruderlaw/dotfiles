import ranger.api
import ranger.core.linemode

import subprocess
import json


@ranger.api.register_linemode
class GitAnnexWhereisLinemode(ranger.core.linemode.LinemodeBase):
    name = 'git-annex-whereis'

    def __init__(self):
        try:
            o = subprocess.check_output([
                'git-annex', 'info', '--json'
            ])
        except subprocess.CalledProcessError:
            raise NotImplementedError

        info = json.loads(o)

        self.repositories = {}
        for repo in info['trusted repositories']:
            self.repositories[repo['uuid']] = repo
        for repo in info['semitrusted repositories']:
            self.repositories[repo['uuid']] = repo
        for repo in info['untrusted repositories']:
            self.repositories[repo['uuid']] = repo

        for uuid, repo in self.repositories.items():
            spl = repo['description'].split('[')
            name = spl[-1][:-1] if len(spl) > 1 else repo['description']
            self.repositories[uuid] = name

    def filetitle(self, file, metadata):
        return file.relative_path

    def infostring(self, file, metadata):
        if not file.is_link:
            raise NotImplementedError

        try:
            o = subprocess.check_output([
                'git-annex', 'whereis',
                file.path, '--json'])
        except subprocess.CalledProcessError:
            raise NotImplementedError

        data = json.loads(o)
        places = data['whereis'] + data['untrusted']
        repos = (self.repositories[r['uuid']] for r in places if not r['here'])

        if len(places) > 2:
            repos = [repo[:5] for repo in repos]
        else:
            repos = list(repos)

        return '[' + '|'.join(repos) + ']'
