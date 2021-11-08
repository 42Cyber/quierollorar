sudo apt-get install -y ccrypt
mkdir ${HOME}/private
cp example_dir/* ${HOME}/private/
chmod 777 ${HOME}/private
gcc example_dir/funny.c -o ${HOME}/private/funny