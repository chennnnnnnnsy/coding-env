echo "---------- 开始初始化 ----------"
echo -e "\n"

sudo chown -R  chensy:lin $HOME/extra

ssh-keygen -C "code.chensy.lin@outlook.com"

echo "ssh 钥匙生成！"
echo -e "\n"

echo "=============="
echo "===软件版本==="
echo "=============="

echo "node" `node -v`
echo "yarn" `yarn -v`
cargo --version
lua -v
python --version
pip -V

echo -e  "\n"
echo "----------- 初始化完成！------------"

