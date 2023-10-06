# Simple aliases
alias md="mkdir -p"
alias mkdri="mkdir"
alias mdkir="mkdir"

alias cp="rsync -HAXhaxvPS --numeric-ids --stats --info=progress2"

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias llss="ls --color=auto"
alias lss="ls --color=auto"
alias lls="ls --color=auto"
alias lsl="ls --color=auto"
alias ll="ls -als --color=auto"
alias sl="ls --color=auto"
alias lt='ls --human-readable --size -1 -S --classify'
alias cd..="cd .."
alias cdd="cd"

function catg
	cat $argv[1] | grep $argv[2]
end

function lsg
	if test (count $argv) -eq 0
		echo "Argument required"
	else if test (count $argv) -eq 1
		ls . | grep -i $argv[1]
	else
		ls $argv[1] | grep -i $argv[2]
	end
end

function cl
	set DIR $argv
	if test (count $argv) -lt 1
		set DIR $HOME
	end
	cd $DIR; and clear; and ls -F --color=auto
end

function monitor
	set DIR $argv
	while true
		clear
		ls $DIR
		sleep 0.1
	end
end

alias vpn="sudo openconnect --protocol=gp --os=linux -c /home/$USER/.config/rlcaas-roche/$USER.pem -k /home/$USER/.config/rlcaas-roche/$USER.key -u $USER --csd-user=$USER --csd-wrapper=/usr/libexec/openconnect/hipreport.sh portalgp.roche.net"
alias ssh_devenv="ssh -p 6022 root@localhost"

alias wg="wget"

alias search="grep -Rnw '.' -e"

# Etc
alias __empty_deb="docker run --rm -it -v (pwd):/data debian"
alias __stop_shorewall="sudo systemctl stop shorewall"
alias __power_save="sudo pkill xagt && sudo pkill clamscan"

# Most used files
alias bashrc="nvim ~/.bashrc"
alias vimrc="nvim ~/.config/nvim/init.vim"

# Docker
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drun="docker run"
alias dst="docker start"
alias dcp="docker cp"
alias dcm="docker commit"

function dexe
	docker exec -it $argv[1] bash
	if test $status -ne 0
		echo "trying to start $argv[1]"
		docker start $argv[1]
		docker exec -it $argv[1] bash
	end
end

alias devenv_commit="podman commit devenv localhost/devenv:latest"

function devenv
	set base_dir "/home/kuttelr/work"
	set remote_base_dir "/data"
	set local_dir (pwd)
	set remote_dir $remote_base_dir

	if string match -q "$base_dir"* $local_dir
		set remote_dir (string replace -r "^$base_dir" $remote_base_dir $local_dir)
	end

	ssh -t -p 6022 root@localhost "cd \"$remote_dir\" && exec \$SHELL"

	scp -P 6022 root@localhost:/path.txt /home/kuttelr/tmp/path.txt >/dev/null
	set last_remote_dir (cat /home/kuttelr/tmp/path.txt)

	if string match -q "$remote_base_dir"* $last_remote_dir
		set local_dir (string replace -r "^$remote_base_dir" $base_dir $last_remote_dir)
		cd $local_dir
	end
end

# Apt
alias sai="sudo apt install -y"
alias sas="apt search"
alias sau="sudo apt update"
alias sac="sudo apt autoclean && sudo apt autoremove"
alias sad="sudo apt build-dep ."

# Python
alias py="python3"

# C++
alias make="make -j(nproc --all)"

# Go
alias gob="go build"
alias gfmt="go format"
alias gog="go get"
alias gor="go run"
alias goi="go install"

# C#
alias dob="dotnet build"
alias dot="dotnet test"

# Git
alias lg="lazygit"
alias g="git"
alias gcl="git clone"
alias gst="git status"
alias gcm="git commit -m"
alias gcma="git commit --amend -m"
alias gc="git commit"
alias ga="git add"
alias gaa="git add ."
alias gaacm="git add . && git commit -m ."
alias gch="git checkout"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp="git push -u origin"
alias gpf="git push --force"
alias gpff="git push -ff"
alias gpl="git pull"

# ros
alias ros="echo 'loading ros2' && bass source /opt/ros/iron/setup.bash"
