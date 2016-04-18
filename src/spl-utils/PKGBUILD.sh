#!/bin/bash

cat << EOF > ${AZB_PKGBUILD_PATH}
${AZB_HEADER}

pkgname="${AZB_SPL_UTILS_PKGNAME}"
pkgver=${AZB_PKGVER}
pkgrel=${AZB_PKGREL}
pkgdesc="Solaris Porting Layer kernel module support files."
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/spl-${AZB_ZOL_VERSION}.tar.gz"
        "spl-utils.hostid")
sha256sums=('${AZB_SPL_SRC_HASH}'
            '${AZB_SPL_HOSTID_HASH}')
groups=("${AZB_ARCHZFS_PACKAGE_GROUP}")
license=("GPL")
provides=("${AZB_SPL_UTILS_PKGNAME}")

build() {
    cd "\${srcdir}/spl-${AZB_ZOL_VERSION}"
    ./autogen.sh

    _at_enable=""
    [ "\${CARCH}" == "i686"  ] && _at_enable="--enable-atomic-spinlocks"

    ./configure --prefix=/usr \\
                --libdir=/usr/lib \\
                --sbindir=/usr/bin \\
                --with-config=user \\
                \${_at_enable}

    make
}

package() {
    cd "\${srcdir}/spl-${AZB_ZOL_VERSION}"
    make DESTDIR="\${pkgdir}" install

    install -D -m644 "\${srcdir}"/spl-utils.hostid "\${pkgdir}"/etc/hostid
}
EOF