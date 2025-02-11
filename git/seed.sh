NAME="git"
DESC="Distributed version control system"
VERSION="2.39.2"
SOURCE="https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.xz"
CHECKSUM="32d34dc65ae0955cc68c7152b5ca8b13"
DEPS=""
FLAGS=""

_setup()
{
	tar -xf $DISTFILES/$(basename $SOURCE)
	cd ${NAME}-${VERSION}
}

_build()
{
	./configure --prefix=$FAKEROOT/$NAME/usr \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3

	make -j${MAKEOPTS}
}

_install()
{
	make perllibdir=/usr/lib/perl5/5.36/site_perl install
}
