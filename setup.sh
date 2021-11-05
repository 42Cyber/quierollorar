sudo su
apt get-install ccrypt
mkdir ${home}/private
mv example_dir/* ${home}/private/
chmod 777 ${home}/private
gcc -o example_dir/funny.c ${home}/private/funny