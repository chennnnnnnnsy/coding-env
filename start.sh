myhome="/home/chensy"

ssh-keygen -C "code.chensy.lin@outlook.com"

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
	mkdir $HOME/.cargo && mv $HOME/configureFiles/config-cargo  $HOME/.cargo/config
}

installLangs

moveConfigureFiles

node -v
yarn -v
cargo --version
lua -v

echo "----------- Done ------------"

