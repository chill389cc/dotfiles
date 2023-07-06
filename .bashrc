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
alias jestfast='npm test -- --maxWorkers=50% --testTimeout=10000'
alias jestserial='npm test -- --runInBand'

# Tracking my .dotfiles in git
# To set this up, first run `git init --bare $HOME/.cfg`,
# then run `config config --local status.showUntrackedFiles no`
# https://www.atlassian.com/git/tutorials/dotfiles
alias dotfiles='~/AppData/Local/Programs/Git/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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
		echo "3. mark the commit you want to change with 'edit' (replace 'pick')"
		echo "4. save the rebase file"
		echo "5. git stash pop, make your change"
		echo "6. git add <file>, then git commit --amend --no-edit"
		echo "7. git rebase --continue"
	elif [ "$1" = "dockercache" ]; then
		echo "docker-compose down --rmi local"
		echo "docker-compose up -d --force-recreate  --renew-anon-volumes"
	else
		echo "rebase"
		echo "dockercache"
	fi
}

