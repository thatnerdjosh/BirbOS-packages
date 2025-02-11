NAME="glib"
DESC="Bundle of three low-level system libraries written in C"
VERSION="2.74.5"
SHORT_VERSION="$(echo "${VERSION}" | awk -F'.' '{print $1 "." $2}')"
SOURCE="https://download.gnome.org/sources/glib/${SHORT_VERSION}/glib-${VERSION}.tar.xz"
CHECKSUM="7561501d9f63f3418ddb23d2903cc968"
DEPS="libxslt pcre2"
FLAGS=""

_setup()
{
	tar -xf $DISTFILES/$(basename $SOURCE)
	cd ${NAME}-${VERSION}
}

_build()
{
	mkdir build
	cd    build

	# libxslt will cause some errors, but they are harmless
	set +e

	meson --prefix=$FAKEROOT/$NAME/usr \
		  --buildtype=release \
		  -Dman=false          \
		  ..

	ninja

	set -e
}

_install()
{
	ninja install

	mkdir -p $FAKEROOT/$NAME/usr/share/doc/glib-${VERSION}
	#cp -r ../docs/reference/{gio,glib,gobject} $FAKEROOT/$NAME/usr/share/doc/glib-${VERSION}
}
