# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# source ~/.bashrc

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls -F --color=auto' 
alias ll='ls -l'
alias la='ls -a'

export MISSING_PROFILE_ERROR="Profile not found"

# Tracking my .dotfiles in git
# To set this up, first run `git init --bare $HOME/.cfg`,
# then run `config config --local status.showUntrackedFiles no`
# https://www.atlassian.com/git/tutorials/dotfiles
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # linux stuff
	echo "custom .bashrc aliases for linux not yet created. Some OS-specific things will not be loaded."
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	# Open a finder window pointed at the current terminal location
	alias finder='open .'
	zipfolder(){
		zip -vXr $1.zip $1/
	}

	pname(){
		local output=$(cat ~/.aws/config | grep --before-context 3 $1 | head --lines 1 | sed -n 's/\[profile \(.*\)\]/\1/p')
		if [ -n "$output" ]; then
			echo "$output"
		else
			echo "$MISSING_PROFILE_ERROR" >&2
		fi
	}


	export PATH="$PATH:/Users/chill/Library/Application Support/terraform"
	# Logitech Litra Glow Commands Setup (https://github.com/ptillemans/litra-control)
	# Brightness only seems to work from 8-98
	alias lc='~/bin/litra-control/target/release/litra-control'
	export LITRA_PATH='DevSrvsID:4295791766'
	# Mac nvm setup
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
	# Note that for .bashrc to be loaded in all git bash terminals on windows, you'll have to add the following
	# line to the following file (I think this makes sure it is loaded in IDE embedded terminals and other
	# integrated git bash terminals):
	# File: C:\Users\<user>\AppData\Local\Program\Git\etc\profile.d\aliases.sh
	# Line: source ~/.bashrc

	# cygwin - POSIX compatibility layer and Linux environment emulation for Windows
	# mysys - Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
	alias dotfiles='~/AppData/Local/Programs/Git/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	# This is necessary for using github.com/jchip/nvm in the embedded terminal in jetbrains apps
	alias nvm='~/nvm/bin/nvm.cmd'
	# Easily open different versions of powershell
	alias ps7='pwsh'
	alias ps5='powershell'
	# Emulate the macos 'open' command:
	alias open='start ""'

	pname(){
		local output=$(cat ~/.aws/config | grep --before-context 3 $1 | head --lines 1 | sed --quiet 's/\[profile \(.*\)\]/\1/p')
		if [ -n "$output" ]; then
			echo "$output"
		else
			echo "$MISSING_PROFILE_ERROR" >&2
		fi
	}
else
	# Unknown.
	echo "using unknown os, some parts of .bashrc will not be loaded"
fi # https://stackoverflow.com/a/8597411/6901706

# Delete all files in directory including dotfiles, but excluding . and ..
alias rmall='rm -rf -- ..?* .[!.]* *'

# For Git
alias forcepush='git push --force-with-lease'
alias safepush='git push --force-with-lease'

# runs a git clean but doesn't delete the .idea directory. Normally git clean would delete this folder which would delete untracked run configuration files.
# oddly, the first exclusion rule doesn't exclude .idea/workspace.xml so the second exclusion rule is necessary
alias safeclean='git clean -dfX -e \!.idea -e \!.idea/workspace.xml'

# Easily switching and checking AWS Profiles
alias ap='printenv AWS_PROFILE'
setap(){
	export AWS_PROFILE=$1;
	echo AWS_PROFILE=$(printenv AWS_PROFILE);
}
setapn(){
	local output=$(pname $1)
	if [[ "$output" == "$MISSING_PROFILE_ERROR" || "$output" == "" ]]; then
		echo "Error: $MISSING_PROFILE_ERROR" >&2
	else
		setap "$output"
	fi
}
	
alias asl='aws sso login'

# Quickly running jest tests with less overhead for a faster run
alias jestfast='npm test -- --maxWorkers=50% --testTimeout=10000'
alias jestserial='npm test -- --runInBand'

# Git branch cleanup script
cleanupbranches(){
	git fetch -p
	for b in $(git for-each-ref --format='%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)' refs/heads)
	do
	  git branch -d $b
	done
}

# Personal 'help' text for things I commonly do in the terminal
cheatsheet(){
	if [ "$1" = "rebase" ]; then
		echo "1. git stash your change"
		echo "2. git rebase -i HEAD~10 (replace 10 with commit you want to edit), adding the '-r' flag if you'll be editing merge commits (see Step 3)."
		echo "3. Edit the merge file:"
		echo "   3.1 - for editing merge commits (Make sure you used the '-r' ('--rebase-merges') flag in the rebase command):"
		echo "      3.1.1 - to rename a merge commit, replace the relevant commit's '-C' with '-c' (after the 'merge' word)"
		echo "      3.1.2 - to edit a merge commit, add the word 'break' after the line for the merge commit"
		echo "   3.2 - for editing normal commits:"
		echo "      3.2.1 - for renaming the commit: replace 'pick' on the commit(s) you want to rename with 'reword'"
		echo "      3.2.2 - for editing the commit: replace 'pick' on the commit(s) you want to change with 'edit'"
		echo "4. save the rebase file"
		echo "5. git stash pop, make your change"
		echo "6. git add <file>, then git commit --amend --no-edit"
		echo "7. git rebase --continue"
		echo "If anything goes wrong, you can use 'git rebase --abort'"
	elif [ "$1" = "dockercache" ]; then
		echo "docker-compose down --rmi local"
		echo "docker-compose up -d --force-recreate  --renew-anon-volumes"
	elif [ "$1" = "shortcut" ]; then
		echo "make a .url file and put this in it:"
		echo "[InternetShortcut]"
		echo "URL="
		echo ""
		echo "And then add the url to the website after the equals sign"
	elif [ "$1" = "git-push-remote" ]; then
		echo "git config --global push.autoSetupRemote true"
	elif [ "$1" = "git-untrack" ]; then
		echo "git rm --cached <path_to_files>"
		echo "optionally add the '-r' flag if untracking folders."
	elif [ "$1" = "command-lookup" ]; then
		echo "'command -v <command>' shell built-in, shows you how the command you specified will be executed (i.e. which file)"
		echo "'which <command>' external binary, steps through $PATH and shows you what you are about to run"
	elif [ "$1" = "bash-tricks" ]; then
		echo "!<command> - re-run the last command matching type <command>"
		echo "^A^B - re-run the last command, replacing A with B"
	elif [ "$1" = "examples" ]; then
		echo "mass file rename: for file in *.json; do mv "$file" "${file%.json}_v1.json"; done"
	elif [ "$1" = "git-blame-history" ]; then
		echo "git log -L <start_line_num>,<end_line_num>:path/to/file.ext"
	else
		echo "rebase"
		echo "git-push-remote"
		echo "git-untrack"
		echo "dockercache"
		echo "shortcut"
		echo "bash-tricks"
		echo "command-lookup"
		echo "examples"
		echo "git-blame-history"
	fi
}

# Shortcuts for terraform commands that I run frequently
alias tfi='terraform init'
alias tfir='terraform init -reconfigure'
alias tfid='terraform init -backend-config=dev.s3.tfbackend'
alias tfip='terraform init -backend-config=prd.s3.tfbackend'
alias tfird='terraform init -backend-config=dev.s3.tfbackend -reconfigure'
alias tfirp='terraform init -backend-config=prd.s3.tfbackend -reconfigure'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfavd='terraform apply --var-file=dev.tfvars'
alias tfavp='terraform apply --var-file=prd.tfvars'
alias tffr='terraform fmt -recursive'
alias tflint='terraform fmt -recursive'
alias tfv='terraform --version'

# Commands for converting markdown to pdf with pandoc

# Accepts a parameter which is the name of your markdown file, without the extension. Will create a pdf with the same name. Uses xelatex so there are no issues with using special characters like greek letters.
md2pdf(){
	# this requires pandoc and the xelatex engine.
	# Mac: install with `brew install xelatex`. xelatext should be installed already.
	# Windows: install xelatex following these instructions: https://stackoverflow.com/a/60687165/6901706
	#   then install pandoc here: https://github.com/jgm/pandoc/releases
	sed -e 's/<sub>/~/g' -e 's!</sub>!~!g' -e 's/<sup>/^/g' -e 's!</sup>!^!g' $1.md | pandoc --from=markdown-implicit_figures --pdf-engine=xelatex -o $1.pdf
	# As you can see, this command also replaces <sup>/<sub> tags with ^/~ because those are the tags that pandoc interprets for superscript and subscript
}

# Add some quick grep commands

# "Grep Wide" - This one just does grep but acts more like 'head' in returning 10 lines surrounding the found result as opposed to just the result of the line
alias grepw='grep -C 5'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
