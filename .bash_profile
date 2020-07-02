export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tf-mac-162/.sdkman"
[[ -s "/Users/tf-mac-162/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tf-mac-162/.sdkman/bin/sdkman-init.sh"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="/usr/local/sbin:$PATH"
