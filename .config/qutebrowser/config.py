#
#               _       _                                     
#    __ _ _   _| |_ ___| |__  _ __ _____      _____  ___ _ __ 
#   / _` | | | | __/ _ \ '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
#  | (_| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |   
#   \__, |\__,_|\__\___|_.__/|_|  \___/ \_/\_/ |___/\___|_|   
#      |_|   
#


# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Set custom User Agent
#config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0')

# Enable Javascript
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Custom Adblock list file
#c.content.host_blocking.lists.append( str(config.configdir) + "/blockedHosts")

# Custom CSS
c.content.user_stylesheets = [
    'css/main.css',
]

# Change Startpages
config.set('url.start_pages', 'https://duckduckgo.com')

# Tab settings
config.set('tabs.padding', {"top": 1, "bottom": 2, "left": 5, "right": 5})
config.set('tabs.indicator.width', 0)
config.set('tabs.favicons.scale', 1.2)

# Disable case sensitivity for searching
config.set('search.ignore_case', 'always')

# Confirm exit when downloading files
c.confirm_quit = ['downloads']

# Fonts
c.fonts.monospace = '"DejaVu Sans Mono"'
c.fonts.completion.category = '10pt DejaVu Sans Mono'
c.fonts.completion.entry = '10pt DejaVu Sans Mono'
c.fonts.tabs = '10pt DejaVu Sans Mono'
c.fonts.statusbar = '10pt DejaVu Sans Mono'
c.fonts.downloads = '11pt DejaVu Sans Mono'
c.fonts.hints = 'bold 10pt DejaVu Sans Mono'
c.fonts.debug_console = '10pt DejaVu Sans Mono'

# Color Scheme
black =      "#070723"
white =      "#b4b5d3" 
red =        "#c13724"
green =      "#23b272"
yellow =     "#d87131"
blue =       "#007bff"
magenta =    "#9919a0"
cyan =       "#19a0a0"

background = "#070723"
main =       "#007bff"


# Set colors from color scheme
c.colors.completion.category.bg = background
c.colors.completion.category.border.bottom= background
c.colors.completion.category.border.top= background
c.colors.completion.category.fg = main
c.colors.completion.fg = white
c.colors.completion.item.selected.bg = main
c.colors.completion.item.selected.border.bottom = main
c.colors.completion.item.selected.border.top = main
c.colors.completion.item.selected.fg = background
c.colors.completion.match.fg = white
c.colors.completion.odd.bg = background 
c.colors.completion.even.bg = background
c.colors.completion.scrollbar.bg = background
c.colors.completion.scrollbar.fg = main
c.colors.downloads.bar.bg = background
c.colors.downloads.error.fg = red
c.colors.downloads.start.bg = background
c.colors.downloads.start.fg = white
c.colors.downloads.stop.bg = background
c.colors.downloads.stop.fg = main
c.colors.hints.bg = yellow
c.colors.hints.fg = background
c.colors.hints.match.fg = yellow
c.colors.keyhint.bg = background
c.colors.keyhint.fg = main
c.colors.keyhint.suffix.fg = main
c.colors.messages.error.fg = main
c.colors.messages.error.bg = background
c.colors.messages.error.border = background
c.colors.messages.info.bg = background
c.colors.messages.info.border = background
c.colors.messages.info.fg = main
c.colors.messages.warning.bg = red
c.colors.messages.warning.border = red
c.colors.messages.warning.fg = background
c.colors.prompts.bg = background
c.colors.prompts.border = background
c.colors.prompts.fg = white
c.colors.prompts.selected.bg = main
c.colors.statusbar.caret.bg = main
c.colors.statusbar.caret.fg = background
c.colors.statusbar.caret.selection.bg = main
c.colors.statusbar.caret.selection.fg = background
c.colors.statusbar.command.bg = main
c.colors.statusbar.command.fg = background
c.colors.statusbar.command.private.bg = main
c.colors.statusbar.command.private.fg = background
c.colors.statusbar.insert.bg = main
c.colors.statusbar.insert.fg = background
c.colors.statusbar.normal.bg = background
c.colors.statusbar.normal.fg = main
c.colors.statusbar.passthrough.bg = main
c.colors.statusbar.passthrough.fg = background
c.colors.statusbar.private.bg = background
c.colors.statusbar.private.fg = white
c.colors.statusbar.progress.bg = main
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.fg = background
c.colors.statusbar.url.hover.fg = main
c.colors.statusbar.url.success.http.fg = main
c.colors.statusbar.url.success.https.fg = main
c.colors.statusbar.url.warn.fg = red
c.colors.tabs.bar.bg = background
c.colors.tabs.even.bg = background
c.colors.tabs.even.fg = main
c.colors.tabs.indicator.error = background
c.colors.tabs.indicator.start = main
c.colors.tabs.indicator.stop = background
c.colors.tabs.odd.bg = background
c.colors.tabs.odd.fg = main
c.colors.tabs.selected.even.bg = main
c.colors.tabs.selected.even.fg = background
c.colors.tabs.selected.odd.bg = main
c.colors.tabs.selected.odd.fg = background
#c.colors.webpage.bg = background
