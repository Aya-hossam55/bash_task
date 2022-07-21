#!/bin/bash

cd
if [ ! -d "./output" ]

then
 mkdir -p ./output

fi 
if [ ! -d "./script" ]

then 
mkdir -p ./script

if [ ! -e "./script/batch_sc.bat" ] 
then

touch ./script/batch_sc.bat

fi

if [ ! -e "./script/python_generator.py" ]

then
 touch ./script/python_generator.py

fi

fi

if [ ! -d "./sw" ] 
then 
mkdir -p ./sw 
if [ ! -e "./sw/profile.c" ]

then

touch ./sw/profile.c

fi

fi 
if [ ! -d "./tools" ]

then 
mkdir -p ./tools

cd ./tools 
sudo yum group install "Development Tools" 
sudo yum install man-pages 
gcc --version

fi 
export A=patha
export B=pathb
echo $A $B

cat <<EOF > ./script/python_generator.py
#!/usr/bin/python
print "hello python"
EOF
chmod 755 ./script/python_generator.py
python ./script/python_generator.py


cat <<EOF > ./sw/profile.c
#!/usr/bin/gcc 
#!/usr/include/stdio.h 
#!/usr/lib/gcc

      #include<stdio.h>
      int main(){
      printf("hello world");
      return 0;
      }
EOF
chmod 755 ./sw/profile.c
gcc profile.c -o profile
./profile.c > ./output/profile.o
