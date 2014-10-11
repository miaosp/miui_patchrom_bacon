#!/bin/bash
#
# $1: dir for original miui app 
# $2: dir for target miui app
#

XMLMERGYTOOL=$PORT_ROOT/tools/ResValuesModify/jar/ResValuesModify
GIT_APPLY=$PORT_ROOT/tools/git.apply
curdir=`pwd`

function adjustDpi() {
    xxhdpi=( $(ls out/$1/res/drawable-xhdpi) )

    for PNG in "${xxhdpi[@]}"; do
        rm -f out/$1/res/drawable-hdpi/$PNG
        rm -f out/$1/res/drawable-xhdpi/$PNG
    done
}

if [ $1 = "Settings" ];then
    cp $1/*.patch out/
	cp $1/*.part out/
    cd out
    $GIT_APPLY Settings.part
    $GIT_APPLY Settings.patch
    cd ..
    for file in `find $2 -name *.rej`
    do
	echo "Fatal error: Settings patch fail"
        exit 1
    done
    $XMLMERGYTOOL $1/res/values $2/res/values
fi

if [ $1 = "Phone" ];then
    cp $1/*.part out/
    cd out
    $GIT_APPLY LTE.part
    cd ..
    for file in `find $2 -name *.rej`
    do
	echo "Fatal error: Phone patch fail"
        exit 1
    done
	$XMLMERGYTOOL $1/res/values $2/res/values
fi

if [ $1 = "MiuiHome" ];then
	sed -i -e 's/<item>4x5<\/item>/<item>4x5<\/item>\
        <item>5x5<\/item>/' out/$1/res/values/arrays.xml
	$XMLMERGYTOOL $1/res/values $2/res/values
fi

if [ $1 = "ThemeManager" ];then
    cp $1/*.patch out/
    cd out
    $GIT_APPLY ThemeManager.patch
    cd ..
    for file in `find $2 -name *.rej`
    do
        echo "Fatal error: ThemeManger patch fail"
        exit 1
    done
fi
