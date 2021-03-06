#!/bin/bash
if [ $# -eq 0 ]
then
	echo "usage: $0 tag_name_or_branch_name"
	exit 1
fi

mkdir -p ~/.thelia/version
cd ~/.thelia/version
git clone https://github.com/thelia/thelia thelia_$1
cd thelia_$1
git checkout tags/$1
git submodule update --init
composer install -o
rm -rf .git
if [ -d "local/modules/HookTest" ] 
then
    rm -rf local/modules/HookTest
fi
if [ -d "templates/frontOffice/hooktest" ]
then
    rm -rf templates/frontOffice/hooktest
fi
cd core/vendor
find . -name ".git" | xargs rm -rf
find . -name ".svn" | xargs rm -rf
cd ../../..
zip -r -y thelia_$1.zip thelia_$1

echo "zip available in ~/.thelia/version"

