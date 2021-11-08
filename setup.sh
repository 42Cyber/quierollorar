sudo apt-get install -y ccrypt
mkdir ${HOME}/private
cp example_dir/* ${HOME}/private/
chmod 777 ${HOME}/private
gcc -o example_dir/funny.c ${HOME}/private/funny