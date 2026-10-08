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

# Format man pages 
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Aliases

## Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles

alias cm="chezmoi"

fish_add_path ~/.local/share/pnpm/bin
fish_add_path ~/.local/bin
