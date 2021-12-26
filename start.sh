myhome="/home/chensy"

ssh-keygen -C "code.chensy.lin@outlook.com"
mkdir $HOME/.cargo && mv $HOME/configureFiles/config-cargo  $HOME/.cargo/config

node -v
yarn -v
cargo --version
lua -v
python --version
pip -V

echo "----------- Done ------------"

