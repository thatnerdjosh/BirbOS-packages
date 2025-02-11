NAME="check"
DESC="Unit testing framework for C"
VERSION="0.15.2"
SOURCE="https://github.com/libcheck/check/releases/download/${VERSION}/check-${VERSION}.tar.gz"
CHECKSUM="50fcafcecde5a380415b12e9c574e0b2"
DEPS=""
FLAGS="test"

_setup()
{
	tar -xf $DISTFILES/$(basename $SOURCE)
	cd ${NAME}-${VERSION}
}

_build()
{
	./configure --prefix=$FAKEROOT/$NAME/usr --disable-static
	make -j${MAKEOPTS}
}

_install()
{
	make docdir=$FAKEROOT/$NAME/usr/share/doc/check-${VERSION} install
}

_test()
{
	make -j${MAKEOPTS} check
}
