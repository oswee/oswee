def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }
    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)
    $time_segment
}

let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
  ($nu.config-path | path dirname | path join 'modules'),
  ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

let-env VISUAL = "nvim"
let-env EDITOR = $"($env.VISUAL)"
let-env GPG_TTY = $"(tty)"
let-env PY_COLORS = 1
let-env QT_QPA_PLATFORM = "wayland"  # Force Qt to use Wayland backend
let-env QT_QPA_PLATFORMTHEME = "qt5ct"
let-env QT_WAYLAND_DISABLE_WINDOWDECORATION = 1
let-env _JAVA_AWT_WM_NONREPARENTING = 1
let-env FZF_DEFAULT_OPTS = "--extended --height 40% --layout=reverse --border"

let-env GOBIN = "/usr/local/go/bin"
let-env GOPATH = $"($nu.home-path)/go"
let-env PNPM_HOME = $"($nu.home-path)/.local/share/pnpm"

# let-env XDG_CONFIG_HOME = $"($nu.home-path)/.config"
# let-env XDG_CACHE_HOME = $"($nu.home-path)/.cache"
# let-env XDG_DATA_HOME = $"($nu.home-path)/.local/share"
# let-env XDG_STATE_HOME = $"($nu.home-path)/.local/state"

# let-env PATH = [
#   /bin
#   /usr/bin
#   /usr/local/bin
#   /usr/local/go/bin
#   $"($env.XDG_DATA_HOME)/.cargo/bin"
#   $"($env.GOBIN)"
#   $"($env.GOPATH)"
#   $"($env.PNPM_HOME)"
#   $"($nu.home-path)/.bin"
#   $"($nu.home-path)/.fzf/bin"
#   $"($nu.home-path)/.local/bin"
#   $"($nu.home-path)/.cargo/bin"
# ]
# let-env PATH = ($env.PATH)

let-env PATH = ($env.PATH | split row ":")
let-env PATH = ($env.PATH | prepend $"($env.GOBIN)")
let-env PATH = ($env.PATH | prepend $"($env.GOPATH)")
let-env PATH = ($env.PATH | prepend $"($env.GOPATH)/bin")
let-env PATH = ($env.PATH | prepend $"($env.PNPM_HOME)")
let-env PATH = ($env.PATH | prepend $"($nu.home-path)/.bin")
let-env PATH = ($env.PATH | prepend $"($nu.home-path)/.fzf/bin")
let-env PATH = ($env.PATH | prepend $"($nu.home-path)/.local/bin")
let-env PATH = ($env.PATH | prepend $"($nu.home-path)/.cargo/bin")

if (which zoxide | is-empty) == false {
    zoxide init nushell --hook prompt | save $'($nu.home-path)/.zoxide.nu'
}

