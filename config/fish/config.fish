### EXPORT ###
export PATH="$PATH:/home/chaitanya/.local/bin"
export ANDROID_SDK_ROOT="/home/chaitanya/Android/Sdk/"
export ANDROID_HOME="/home/chaitanya/Android/Sdk/"
export ANDROID_AVD_HOME="/home/chaitanya/.android/avd"
export PYTHONPATH="/usr/bin/python3"

set fish_greeting                      # Supresses fish's intro message
set TERM "xterm-256color"              # Sets the terminal type

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
# function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
# end
### END OF VI MODE ###

# Locale
export LANG="en_IN.UTF-8"
export LC_ALL="en_IN.UTF-8"

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal '#57fffc' 
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command '#57fffc'
set fish_color_error '#ff6c6b'
set fish_color_param '#57fffc'

# root privileges
# alias sudo="sudo --"

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
# alias vim='nvim'
alias q='exit'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'


# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Print each entry on path on a new line
function ppath
  for path in $PATH
    echo $path
  end
end

# Brightness Commands

function bi
  sudo brightnessctl -d "intel_backlight" set +5%
end

function bd
  sudo brightnessctl -d "intel_backlight" set 5%-
end

function bset -a brightness
  brightnessctl -d "intel_backlight" set $brightness
end
################################################################################
# Note Taking system
################################################################################
#
function buildNote -a filename
  set dname (dirname "$filename")
  set target "$dname/../pdf"
  set bname (basename "$filename" .md)
  set outputFile "$bname.pdf"

  pandoc $filename --pdf-engine=xelatex \
          -V 'mainfont:DejaVuSerif' \
          -V 'mainfontoptions:Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' \
          -V 'sansfont:DejaVuSans.ttf' \
          -V 'monofont:DejaVuSansMono.ttf' \
          -o "$target/$outputFile" &
end

function showNote
  bash /home/chaitanya/.config/nvim/notetaker/showNote 
end 
################################################################################

# FUN ALIASES
# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Star Wars
alias starWars='telnet towel.blinkenlights.nl'


### Generate Random ASCII Art


function art
  set random_index (random 1 2)
  set cond 1
  if test $cond -eq $random_index
    colorscript -r
  else
    fortune | cowsay
  end
end

art

starship init fish | source
