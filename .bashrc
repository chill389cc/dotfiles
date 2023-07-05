alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias la='ls -a'

# For Windows (Using Git Bash)
alias p7='pwsh'
alias p5='powershell'

# Easily switching and checking AWS Profiles
alias ap='printenv AWS_PROFILE'
setap(){
	export AWS_PROFILE=$1;
	echo AWS_PROFILE=$(printenv AWS_PROFILE);
}

# Quickly running jest tests with less overhead for a faster run
alias jestFast='npm test -- --maxWorkers=50%'

# Tracking my .dotfiles in git
# To set this up, first run `git init --bare $HOME/.cfg`,
# then run `config config --local status.showUntrackedFiles no`
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotfiles='~/AppData/Local/Programs/Git/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

