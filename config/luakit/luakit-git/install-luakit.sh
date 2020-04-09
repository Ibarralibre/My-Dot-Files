#!/bin/sh

pkgname=luakit-git
_gitname=luakit
pkgver=2.1.r30.g7522331a

if [ -f $pkgname-1:$pkgver-1-x86_64.pkg.tar.gz ]; then
	rm $pkgname-1:$pkgver-1-x86_64.pkg.tar.gz;
fi
if [ -f $pkgname-$pkgver.tar.gz ]; then
	rm $pkgname-$pkgver.tar.gz;
fi
if [ -d pkg ]; then
	sudo rm -r pkg;
fi
if [ -d src ]; then
	sudo rm -r src
fi

if [ ! -d configs-$_gitname ]; then
	if [ -d $_gitname ]; then
		mv $_gitname configs-$_gitname;
		break
	fi
	
	if [ ! -d $_gitname ] && [ -d configs-$_gitname ]; then
		git clone https://github.com/luakit/luakit.git
	fi

	if [ -d $_gitname ]; then
	 	mv $_gitname configs-$_gitname
	else
		echo ""
		echo ""
		echo "we failed to download luakit"
		echo "pleas download luakit from https://github.com/luakit/luakit manually"
		echo "and paste it on this folder (luakit-git folder)"
		exit 1
	fi
fi

tar -czvf $pkgname-$pkgver.tar.gz configs-$_gitname

if [ -f $pkgname-$pkgver.tar.gz ]; then
	makepkg;

	if [[ -f $pkgname-1:$pkgver-1-x86_64.pkg.tar.gz ]]; then
		sudo pacman -U $pkgname-1:$pkgver-1-x86_64.pkg.tar.gz
		echo installed/updated;
	fi
fi
