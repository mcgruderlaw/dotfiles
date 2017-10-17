c.tabs.position = "top"
c.url.start_pages = ["about:blank"]
config.unbind('J', mode='normal')
config.unbind('K', mode='normal')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('q', 'quit')
c.fonts.hints = "bold 12pt monospace"
c.fonts.statusbar = "10 pt monospace"
c.fonts.tabs = "10pt monospace"
c.messages.timeout = 7000
c.hints.uppercase = True
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}",
                       "4": "https://4chan.org/{}",
                       "4cat": "https://4chan.org/{}/catalog",
                       "8": "https://8ch.net/{}",
                       "8cat": "https://8ch.net/{}/catalog.html",
                       "am": "https://www.amazon.com/?search={}",
                       "aw": "https://wiki.archlinux.org/?search={}",
                       "eb": "http://ebay.com/sch/{}",
                       "gh": "https://github.com/search?utf8=/&q={}&type=",
                       "gw": "https://wiki.gentoo.org/?search={}",
                       "i": "https://duckduckgo.com/?q=!ddgi {}",
                       "ig": "https://wiki.installgentoo.com/?search={}",
                       "im": "http://www.imdb.com/find?s=all&q={}",
                       "lain": "http://lainchan.org/{}",
                       "laincat": "http://lainchan.org/{}/catalog.html",
                       "map": "http://openstreetmap.org/search?query={}",
                       "r": "https://reddit.com/r/{}",
                       "tpb": "http://thepiratebay.org/search/{}",
                       "tw": "https://twitter.com/{}",
                       "w": "https://en.wikipedia.org/?search={}",
                       "yt": "https://youtube.com/results?search_query={}"
                       }
c.aliases = {"bar": "open https://blackagendareport.com",
             "bb": "https://bitbucket.org",
             "bl": "open http://thebiglead.com",
             "cr": "open http://www.cracked.com",
             "ds": "open https://deadspin.com",
             "es": "open http://www.espn.com",
             "git": "open https://www.github.com/mcgruderlaw",
             "ic": "open https://www.icle.org",
             "lh": "open https://lifehacker.com",
             "michbar": "open https://www.zeekbeek.com/SBM",
             "ra": "open http://www.racer.com",
             "rm": "open https://rm5.rocketmatter.net/mcgruderlaw/app.aspx#/dashboard",
             "ro": "open https://www.theroot.com"
             }
