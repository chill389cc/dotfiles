alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias la='ls -a'

alias nvm='~/nvm/bin/nvm.cmd'

# Delete all files in directory including dotfiles, but excluding . and ..
alias rmall='rm -rf -- ..?* .[!.]* *'

# For Windows (Using Git Bash)
alias ps7='pwsh'
alias ps5='powershell'

# For Git
alias forcepush='git push --force-with-lease'
# runs a git clean but doesn't delete the .idea directory. Normally git clean would delete this folder which would delete untracked run configuration files.
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

# Tracking my .dotfiles in git
# To set this up, first run `git init --bare $HOME/.cfg`,
# then run `config config --local status.showUntrackedFiles no`
# https://www.atlassian.com/git/tutorials/dotfiles
alias dfwin='~/AppData/Local/Programs/Git/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dfmac='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
	else
		echo "rebase"
		echo "dockercache"
	fi
}

# Shortcuts for terraform commands that I run frequently
alias tfavd='terraform apply --var-file=dev.tfvars'
alias tfavp='terraform apply --var-file=prd.tfvars'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfv='terraform --version'


