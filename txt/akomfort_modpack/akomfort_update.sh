# This script should only be used by HybridDog

show_url() {
	# show the github link
	if grep -q home .git/config
		then url=home
	else
		url=origin
	fi
	git remote get-url $url | tr -d "\n"
}

show_branch() {
	# show the used branch
	binfo=$(git status -sb --porcelain)
	if echo $binfo | grep -q hversion
		then echo -n hversion
	else if echo $binfo | grep -q master
		then echo -n master
	else
		exit 1
	fi fi
}

show_clone_cmd() {
	echo -n "git clone --single-branch -b "
	show_branch
	echo -n " "
	show_url
}

show_full_cmd() {
	cd $1
	clone_cmd=$(show_clone_cmd)
	cd ..
	echo "if [ -e $1 ] ; then (cd $1; git pull); else $clone_cmd; fi"
}

output_commands() {
	# show mod clone or pull commands
	for m in */
		do show_full_cmd $m
	done

	# show ensuring the modpack.txt exists
	echo "touch modpack.txt"
}

# go to my modpack location
cd ~/.minetest/mods/akomfort

output_commands
