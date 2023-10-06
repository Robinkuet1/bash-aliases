#simple aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias c="cat"
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

lsg() {
	if [ -z $1 ]; then
		echo "Argument required"
	elif [ -z $2 ]; then
		ls . | grep -i $1
	else
		ls $1 | grep -i $2
	fi
}

cl() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		DIR=$HOME
	fi
	builtin cd "${DIR}" &&
		clear
	ls -F --color=auto
}

monitor() {
	DIR="$*"
	while true; do
		clear
		ls $DIR
		sleep 0.1
	done
}

alias wg="wget"

alias search="grep -Rnw '.' -e"

#etc
alias __empty_deb="docker run --rm -it -v $(pwd):/data debian"
alias __stop_shorewall="sudo systemctl stop shorewall"
alias __power_save="sudo pkill xagt && sudo pkill clamscan"

#most used files
alias bashrc="vi ~/.bashrc"
alias vimrc="vi ~/.config/nvim/init.vim"

#docker
alias dps="docker ps"
alias drun="docker run"
alias dst="docker start"
alias dcp="docker cp"
alias dcm="docker commit"
dexe() {
	docker exec -it $1 bash
	if [ $? -ne 0 ]; then
		echo "trying to start $1"
		docker start $1
		docker exec -it $1 bash
	fi
}
alias devenv_commit="docker commit devenv docker_devenv:latest"
alias devenv="docker run -v .:/data --rm -it --entrypoint bash --network host --name devenv docker_devenv:latest"
alias sync_logs="rm -rf /var/log/devenv/log/* && dcp docker_devenv_1:/var/log /var/log/devenv"

#apt
alias sai="sudo apt install -y"
alias sas="apt search"
alias sau="sudo apt update"
alias sac="sudo apt autoclean && sudo apt autoremove"
alias sad="sudo apt build-dep ."

#python
alias py="python3"

#cpp
alias make="make -j$(nproc --all)"
alias cbuild='if [[ $(basename "$PWD") == *"build"* ]]; then rm -rf ./* && cmake .. && make -j$(nproc --all); else if [[ -d "$PWD/build" ]]; then cd build && rm -rf ./* && cmake .. && make -j$(nproc --all);	fi; echo "not in build folder"; fi; if [[ -f "$PWD/simenv" ]]; then source simenv; fi'

#go
alias gob="go build"
alias gfmt="go format"
alias gog="go get"
alias gor="go run"
alias goi="go install"

#c#
alias dob="dotnet build"
alias dot="dotnet test"

#git
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
