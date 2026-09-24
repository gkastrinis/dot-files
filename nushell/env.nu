# Editor configuration
$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.config.edit_mode = "vi"

# Locale settings
$env.LC_ALL = "en_US.UTF-8"
$env.LANG = "en_US.UTF-8"
$env.LANGUAGE = "en_US.UTF-8"
$env.TERM = "xterm-256color"

# PATH configuration
$env.PATH = ($env.PATH | split row (char esep) | prepend [
    "."
    "/usr/local/sbin"
    "/usr/local/bin"
    "/nix/var/nix/profiles/default/bin/"
    $"($env.HOME)/dot-files"
    $"($env.HOME)/nvim-macos-x86_64-nightly/bin"
    "/opt/homebrew/opt/python@3.14/libexec/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/opt/openjdk/bin"
    $"($env.HOME)/.local/bin"
])

let pika = [
"⠀⠀⠀⣿⣿⣶⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣿⣿ "
"⠀⠀⠀⢹⣿⣿⡟⠀⠉⠳⣄⣀⣀⣤⣤⣤⣤⣀⣀⣠⠞⠉⠀⢻⣿⣿⡏ "
"⠀⠀⠀⠀⢻⣿⠁⠀⠀⠶⠛⠉⠁⠀⠀⠀⠀⠈⠉⠛⠶⠀⠀⠈⣿⡟⠀ "
"⠀⠀⠀⠀⠀⠻⢦⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⡴⠟⠀⠀ "
" ⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠸⡇ "
"⠀⠀⠀⠀⠀⠀⣿⠀⣴⠟⣿⣦⠀⠀⠀⠀⠀ ⣴⣿⠻⣆ ⣿⠀"
"⠀⠀⠀⠀⠀⢠⡟⠀⠻⣦⣤⠟⠀⠀⣤⣤⠀⠀⠻⣤⣴⠟⠀⢻⡄"
"⠀⠀⠀⠀⠀⣿⣾⣿⣷⣄⠀⠰⢦⣤⡼⢧⣤⡴⠆⠀⣠⣾⣿⣷⣿⠀"
"⠀⠀⠀⠀⠀⠹⣿⣿⣿⡿⠀⠀⠀⣿⠀⠀⡿⠀⠀⠀⢿⣿⣿⣿⠏⠀"
"⠀⠀⠀⠀⠀⠀⠙⢿⣏⡀⠀⠀⠀⠸⣦⡼⠃⠀⠀⠀⢀⣹⡿⠋⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠳⠶⠤⣤⣤⣤⣤⠤⠶⠚⠋⠁ "
]
let s_mem = (sys mem)
let s_ho = (sys host)
print $"(ansi reset)(ansi yellow_bold)($pika.0)"
print $"(ansi yellow_bold)($pika.1)  (ansi yellow) (ansi yellow_bold)Nushell (ansi reset)(ansi yellow)v(version | get version)(ansi reset)"
print $"(ansi yellow_bold)($pika.2)  (ansi light_blue) (ansi light_blue_bold)RAM (ansi reset)(ansi light_blue)($s_mem.used) / ($s_mem.total)(ansi reset)"
print $"(ansi yellow_bold)($pika.3)  (ansi light_purple)⚡(ansi light_purple_bold)Uptime (ansi reset)(ansi light_purple)($s_ho.uptime)(ansi reset)"
$pika | skip 4 | each { |line| print $"(ansi yellow_bold)($line)" } | ignore
