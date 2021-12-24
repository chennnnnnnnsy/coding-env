myhome="/home/chensy"

function installLangs () {
	langs=(\
		'nodejs-lts-gallium' \
		'yarn' \
		'lua' \
		'rustup' \
	)

	installCMD='sudo pacman -S --noconfirm'

	for i in ${langs[*]}
	do
		installCMD=$installCMD' '${i}
	done

	${installCMD} && rustup toolchain install stable
}

function moveConfigureFiles () {
	mv $HOME/configureFiles/config-cargo  $HOME/.cargo/config
}

installLangs

moveConfigureFiles


echo "----------- Done ------------"



