set -gx EDITOR nvim

if not status is-interactive
  exit
end

# Run fastfetch as welcome message
function fish_greeting
  # if test (tput cols) -lt 80
  #   fastfetch --logo-position top
  # else
  #   fastfetch --logo-position left
  # end
  fastfetch
end


# Aliases

## Replace ls with eza
alias ls='eza -l --color=always --group-directories-first --icons=always'
alias la='eza -a1 --color=never'
alias ll='eza -al --color=always --group-directories-first --icons=always'
alias lt='eza -T --color=always --group-directories-first --icons=always'
alias lta='eza -Ta --color=always --group-directories-first --icons=always'
alias l.="eza -a | grep -e '^\.'"

alias cm="chezmoi"

alias lvim="NVIM_APPNAME=lvim nvim"

# Path env var

fish_add_path ~/.local/share/pnpm/bin
fish_add_path ~/.local/bin

# Misc

zoxide init fish | source

## Format man pages 
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
