# config.nu

$env.config = ($env.config | upsert show_banner false)
$env.config = ($env.config | upsert buffer_editor "nvim")

# Git completions
def "nu-complete git branches" [] {
    git branch | lines | each { |line| $line | str replace '* ' '' | str trim }
}

def "nu-complete git remotes" [] {
    git remote | lines
}

export extern "git branch" [
    branch?: string@"nu-complete git branches"  # Branch name
    --delete(-d)                                # Delete branch
    --force(-f)                                 # Force
    --move(-m)                                  # Move/rename branch
    --list(-l)                                  # List branches
    --all(-a)                                   # List all branches
]

export extern "git checkout" [
    branch?: string@"nu-complete git branches"  # Branch name
    --force(-f)                                 # Force
]

export extern "git go" [
    branch?: string@"nu-complete git branches"  # Branch name
    --force(-f)                                 # Force
]

export extern "git push" [
    remote?: string@"nu-complete git remotes"   # Remote name
    branch?: string@"nu-complete git branches"  # Branch name
    --force(-f)                                 # Force push
    --set-upstream(-u)                          # Set upstream
]

# Aliases
alias cp = cp -r
# alias rm = rm -f
alias ll = ls
alias la = ls -a
alias cat = bat
alias vim = nvim
alias vin = nvim
alias vi = nvim
alias v = nvim
alias w = rg
alias lz = lazygit

# Python venv activation
def --env venv-activate [path: string = ".venv"] {
    $env.VIRTUAL_ENV = ([$env.PWD, $path] | path join | path expand)
    $env.PATH = ($env.PATH | prepend ($env.VIRTUAL_ENV + "/bin"))
}

# Starship prompt
$env.PROMPT_COMMAND = { || starship prompt --cmd-duration $env.CMD_DURATION_MS | str trim }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = "::: "
