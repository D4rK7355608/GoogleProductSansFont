#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
# This script will be executed in post-fs-data mode

APILEVEL=$(getprop ro.build.version.sdk)

#Copy original fonts.xml to the MODDIR to overwrite dummy file
mkdir $MODDIR/system/etc
cp /system/etc/fonts.xml $MODDIR/system/etc

#Function to remove original ja
remove_ja() {
  sed -i -e '/<family lang="ja"/,/<\/family>/d' $1
}

#Function to add ja above zh-Hans
add_ja() {
  if [ $APILEVEL -ge 31 ] ; then
		#Android 12 and later
		sed -i 's@<family lang="zh-Hans">@<family lang="ja">\n        <font weight="100" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Thin.ttf</font>\n        <font weight="300" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Light.ttf</font>\n        <font weight="400" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal" postScriptName="NotoSansCJKjp-Regular">Koruri-Extrabold.ttf</font>\n        <font weight="100" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Thin.ttf</font>\n        <font weight="300" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Light.ttf</font>\n        <font weight="400" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal" postScriptName="NotoSansCJKjp-Regular" fallbackFor="serif">Koruri-Extrabold.ttf</font>\n    </family>\n    <family lang="zh-Hans">@g' $1
	else
		sed -i 's@<family lang="zh-Hans">@<family lang="ja">\n        <font weight="100" style="normal">Koruri-Thin.ttf</font>\n        <font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>\n        <font weight="100" style="normal" fallbackFor="serif">Koruri-Thin.ttf</font>\n        <font weight="300" style="normal" fallbackFor="serif">Koruri-Light.ttf</font>\n        <font weight="400" style="normal" fallbackFor="serif">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal" fallbackFor="serif">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal" fallbackFor="serif">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal" fallbackFor="serif">Koruri-Extrabold.ttf</font>\n    </family>\n    <family lang="zh-Hans">@g' $1
	fi
}

#Function to replace Roboto font
replace_roboto() {
  if [ $API -ge 31 ] ; then
		#Android 12 and later
		sed -i 's@style="normal">Roboto-Regular.ttf@style="normal">OpenSans-VariableFont.ttf@g' $1
		sed -i 's@style="italic">Roboto-Regular.ttf@style="italic">OpenSans-Italic-VariableFont.ttf@g' $1
		sed -i 's@RobotoStatic-Regular.ttf@Roboto-Regular.ttf@g' $1
	fi
}

#Change fonts.xml file
remove_ja $MODDIR/system/etc/fonts.xml
add_ja $MODDIR/system/etc/fonts.xml
replace_roboto $MODDIR/system/etc/fonts.xml

#Goodbye, SomcUDGothic
sed -i 's@SomcUDGothic-Light.ttf@null.ttf@g' $MODDIR/system/etc/fonts.xml
sed -i 's@SomcUDGothic-Regular.ttf@null.ttf@g' $MODDIR/system/etc/fonts.xml

#Goodbye, OnePlus Font
sed -i 's@OpFont-@Roboto-@g' $MODDIR/system/etc/fonts.xml
sed -i 's@NotoSerif-@Roboto-@g' $MODDIR/system/etc/fonts.xml

#Goodbye, OPLUS Font
sed -i 's@SysFont-Regular@Roboto-Regular@g' $MODDIR/system/etc/fonts.xml
sed -i 's@SysSans-En-Regular@Roboto-Regular@g' $MODDIR/system/etc/fonts.xml

#Goodbye, Xiaomi Font
/system/bin/sed -i -z 's@<family name="sans-serif">\n    <!-- # MIUI Edit Start -->.*<!-- # MIUI Edit END -->@<family name="sans-serif">@' $MODDIR/system/etc/fonts.xml
sed -i 's@MiSansVF.ttf@Roboto-Regular.ttf@g' $MODDIR/system/etc/fonts.xml
if [ -e /system/fonts/MiSansVF.ttf ]; then
	cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/MiSansVF.ttf
fi
#For MIUI 13+
sed -i 's@MiSansVF_Overlay.ttf@Roboto-Regular.ttf@g' $MODDIR/system/etc/fonts.xml
if [ -e /system/fonts/MiSansVF_Overlay.ttf ]; then
	cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/MiSansVF_Overlay.ttf
fi

#Goodbye, vivo Font
sed -i 's@VivoFont.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/fonts.xml
sed -i 's@DroidSansFallbackBBK.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/fonts.xml
if [ -e /system/fonts/HYQiHei-50.ttf ]; then
cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/HYQiHei-50.ttf
fi
if [ -e /system/fonts/DroidSansFallbackBBK.ttf ]; then
cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/DroidSansFallbackBBK.ttf
fi
if [ -e /system/fonts/DroidSansFallbackMonster.ttf ]; then
cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/DroidSansFallbackMonster.ttf
fi
if [ -e /system/fonts/DroidSansFallbackZW.ttf ]; then
cp /system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/DroidSansFallbackZW.ttf
fi

#Copy fonts_slate.xml for OnePlus
opslate=fonts_slate.xml
if [ -e /system/etc/$opslate ]; then
    cp /system/etc/$opslate $MODDIR/system/etc
	
	#Change fonts_slate.xml file
	remove_ja $MODDIR/system/etc/$opslate
	add_ja $MODDIR/system/etc/$opslate

	sed -i 's@SlateForOnePlus-Thin.ttf@Koruri-Light.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Light.ttf@Koruri-Light.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Book.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Regular.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Medium.ttf@Koruri-Semibold.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Bold.ttf@Koruri-Bold.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Black.ttf@Koruri-Extrabold.ttf@g' $MODDIR/system/etc/$opslate
fi

#Copy fonts_base.xml for OnePlus OxygenOS 11+
oos11=fonts_base.xml
if [ -e /system/etc/$oos11 ]; then
    cp /system/etc/$oos11 $MODDIR/system/etc
	
	#Change fonts_slate.xml file
	remove_ja $MODDIR/system/etc/$oos11
	add_ja $MODDIR/system/etc/$oos11

	sed -i 's@NotoSerif-@Roboto-@g' $MODDIR/system/etc/$oos11
fi

#Copy fonts_base.xml for OnePlus OxygenOS 12+
oos12=fonts_base.xml
if [ -e /system/system_ext/etc/$oos12 ]; then
    cp /system/system_ext/etc/$oos12 $MODDIR/system/system_ext/etc
	
	#Change fonts_slate.xml file
	remove_ja $MODDIR/system/system_ext/etc/$oos12
	add_ja $MODDIR/system/system_ext/etc/$oos12

	sed -i 's@NotoSerif-@Roboto-@g' $MODDIR/system/system_ext/etc/$oos12
fi
