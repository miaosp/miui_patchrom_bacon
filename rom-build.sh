#usage: ./Fullota.sh 4.8.21
# !/bin/sh
OTAPATH=otapath
VERSION=$1
if [ -z $1 ];then
VERSION=`date +"%m.%d"`
fi

DATE=`date +"%H%M%S"`

MODEL=OnePlus

FULLNAME=miui_"$MODEL"_"$VERSION"_"$DATE"_38R.zip

echo 正在编译"$FULLNAME"
echo 请耐心等候。。。
export PORT_PRODUCT=$MODEL
cd ..
. build/envsetup.sh -p "$MODEL" 
cd -
make fullota BUILD_NUMBER=$VERSION
mv  out/fullota.zip ./"$FULLNAME"
if [ ! -d $OTAPATH ];
then
mkdir otapath
fi
mv  out/target_files.zip ./otapath/$VERSION.zip
echo 编译完成，谢谢使用
