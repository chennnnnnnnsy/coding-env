myhome="/home/chensy"

function installLangs () {
	langs=(\
		'nodejs-lts-gallium' \
		'yarn' \
		'lua' \
		'rust' \
	)

	installCMD='sudo pacman -S --noconfirm'

	for i in ${langs[*]}
	do
		installCMD=$installCMD' '${i}
	done

	${installCMD}
}

function moveConfigureFiles () {
	mv $HOME/configureFiles/config-cargo  $HOME/.cargo/config
}

installLangs

moveConfigureFiles


echo "----------- Done ------------"



