MODDIR=${0%/*}

sed 's/<\/familyset>//g' /system/etc/fonts.xml | cat - $MODDIR/fallback.xml > $MODDIR/system/etc/fonts.xml

if getprop ro.product.manufacturer |
        grep -qE -e "^samsung"; then
		cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/SamsungColorEmoji.ttf
		sed 's/<\/familyset>//g' /system/etc/fonts_additional.xml | cat - $MODDIR/fallback.xml > $MODDIR/system/etc/fonts_additional.xml
fi

if getprop ro.product.manufacturer |
        grep -qE -e "^LGE"; then
		cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/LGNotoColorEmoji.ttf
fi

if getprop ro.product.manufacturer |
        grep -qE -e "^HTC"; then
		cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/HTC_ColorEmoji.ttf
fi

cp $MODDIR/system/product/fonts/GoogleSans-Italic.ttf $MODDIR/system/product/fonts/Lato-Italic.ttf
cp $MODDIR/system/product/fonts/GoogleSans-Italic.ttf $MODDIR/system/product/fonts/Rubik-Italic.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/ArbutusSlab-Regular.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/BigShouldersText-ExtraBold.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/Fraunces-Regular.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/Karla-Regular.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/Lato-Regular.ttf
cp $MODDIR/system/product/fonts/Rubik-Regular.ttf $MODDIR/system/product/fonts/Lustria-Regular.ttf
cp $MODDIR/system/product/fonts/Rubik-Medium.ttf $MODDIR/system/product/fonts/Barlow-Medium.ttf
cp $MODDIR/system/product/fonts/Rubik-Medium.ttf $MODDIR/system/product/fonts/Lato-Medium.ttf
cp $MODDIR/system/product/fonts/Rubik-Medium.ttf $MODDIR/system/product/fonts/ZillaSlab-Medium.ttf
cp $MODDIR/system/product/fonts/Rubik-MediumItalic.ttf $MODDIR/system/product/fonts/Lato-MediumItalic.ttf
cp $MODDIR/system/product/fonts/Rubik-MediumItalic.ttf $MODDIR/system/product/fonts/ZillaSlab-MediumItalic.ttf
cp $MODDIR/system/product/fonts/Rubik-BoldItalic.ttf $MODDIR/system/product/fonts/Lato-BoldItalic.ttf
cp $MODDIR/system/product/fonts/Rubik-BoldItalic.ttf $MODDIR/system/product/fonts/ZillaSlab-SemiBoldItalic.ttf
cp $MODDIR/system/product/fonts/Rubik-Bold.ttf $MODDIR/system/product/fonts/Barlow-Bold.ttf
cp $MODDIR/system/product/fonts/Rubik-Bold.ttf $MODDIR/system/product/fonts/BigShouldersText-Bold.ttf
cp $MODDIR/system/product/fonts/Rubik-Bold.ttf $MODDIR/system/product/fonts/Fraunces-SemiBold.ttf
cp $MODDIR/system/product/fonts/Rubik-Bold.ttf $MODDIR/system/product/fonts/Lato-Bold.ttf
cp $MODDIR/system/product/fonts/Rubik-Bold.ttf $MODDIR/system/product/fonts/ZillaSlab-SemiBold.ttf
cp $MODDIR/system/fonts/Roboto-Italic.ttf $MODDIR/system/fonts/RobotoCondensed-Italic.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/RobotoCondensed-Light.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/RobotoCondensed-Regular.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/Roboto-Light.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/RobotoStatic-Regular.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/Roboto-Thin.ttf
cp $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/RobotoNum-3L.ttf
cp $MODDIR/system/fonts/Roboto-LightItalic.ttf $MODDIR/system/fonts/RobotoCondensed-LightItalic.ttf
cp $MODDIR/system/fonts/Roboto-LightItalic.ttf $MODDIR/system/fonts/Roboto-ThinItalic.ttf
cp $MODDIR/system/fonts/Roboto-MediumItalic.ttf $MODDIR/system/fonts/RobotoCondensed-MediumItalic.ttf
cp $MODDIR/system/fonts/Roboto-BoldItalic.ttf $MODDIR/system/fonts/Roboto-BlackItalic.ttf
cp $MODDIR/system/fonts/Roboto-BoldItalic.ttf $MODDIR/system/fonts/RobotoCondensed-BoldItalic.ttf
cp $MODDIR/system/fonts/Roboto-Medium.ttf $MODDIR/system/fonts/RobotoCondensed-Medium.ttf
cp $MODDIR/system/fonts/Roboto-Bold.ttf $MODDIR/system/fonts/Roboto-Black.ttf
cp $MODDIR/system/fonts/Roboto-Bold.ttf $MODDIR/system/fonts/RobotoCondensed-Bold.ttf
cp $MODDIR/system/fonts/Roboto-Bold.ttf $MODDIR/system/fonts/RobotoNum-3R.ttf