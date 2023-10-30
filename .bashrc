alias ls='ls -F --color=auto' 
alias ll='ls -l'
alias la='ls -a'

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
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
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
		echo "2. git rebase -i HEAD~10 (replace 10 with commit you want to edit)"
		echo " (Optionally, include the '-r' flag to include merge commits, and replace the 'merge -C' with 'merge -c' on those merge commits that you'd like to rename.)"
		echo "3. replace 'pick' on the commit(s) you want to change with 'edit' (if you want to edit the code) or 'reword' (if you just want to edit the commit message)"
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
	else
		echo "rebase"
		echo "git-push-remote"
		echo "git-untrack"
		echo "dockercache"
		echo "shortcut"
	fi
}

# Shortcuts for terraform commands that I run frequently
alias tfavd='terraform apply --var-file=dev.tfvars'
alias tfavp='terraform apply --var-file=prd.tfvars'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfv='terraform --version'

# Commands for converting markdown to pdf with pandoc

# Accepts a parameter which is the name of your markdown file, without the extension. Will create a pdf with the same name. Uses xelatex so there are no issues with using special characters like greek letters.
md2pdf(){
	# this requires pandoc and the xelatex engine.
	# Mac: install with `brew install xelatex`. xelatext should be installed already.
	# Windows: install xelatex following these instructions: https://stackoverflow.com/a/60687165/6901706
	#   then install pandoc here: https://github.com/jgm/pandoc/releases
	sed -e 's/<sub>/~/g' -e 's!</sub>!~!g' -e 's/<sup>/^/g' -e 's!</sup>!^!g' $1.md | pandoc --from=markdown --pdf-engine=xelatex -o $1.pdf
	# As you can see, this command also replaces <sup>/<sub> tags with ^/~ because those are the tags that pandoc interprets for superscript and subscript
}

# Add some quick grep commands

# "Grep Wide" - This one just does grep but acts more like 'head' in returning 10 lines surrounding the found result as opposed to just the result of the line
alias grepw='grep -C 5'
