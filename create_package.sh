#!/bin/sh

# Create a template package from a package name
PKG_NAME="$1"

[ -d $PKG_NAME ] && echo "A package with name [$PKG_NAME] has already been created!" && exit 1

mkdir -pv $PKG_NAME

cat > $PKG_NAME/seed.sh << "EOF"
NAME="|PACKAGE_NAME|"
DESC=""
VERSION=""
SOURCE=""
CHECKSUM=""
DEPS=""
FLAGS=""

_setup()
{
	# tar -xvf $DISTFILES/some-package-${VERSION}.tar.xz
}

_build()
{
	# Build the package here
}

_install()
{
	# make prefix=$FAKEROOT/usr install
}
EOF

# Update the package name
sed -i "s/|PACKAGE_NAME|/$PKG_NAME/g" $PKG_NAME/seed.sh
