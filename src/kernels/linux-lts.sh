# For build.sh
mode_name="lts"
mode_desc="Select and use the packages for the linux-lts kernel"

# Kernel versions for LTS packages
pkgrel="1"
kernel_version="4.4.9-1"
kernel_version_next="4.5"

header="\
# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# This PKGBUILD was generated by the archzfs build scripts located at
#
# http://github.com/archzfs/archzfs
#
# ! WARNING !
#
# The archzfs packages are kernel modules, so these PKGBUILDS will only work with the kernel package they target. In this
# case, the archzfs-linux-lts packages will only work with the default linux-lts package! To have a single PKGBUILD target
# many kernels would make for a cluttered PKGBUILD!
#
# If you have a custom kernel, you will need to change things in the PKGBUILDS. If you would like to have AUR or archzfs repo
# packages for your favorite kernel package built using the archzfs build tools, submit a request in the Issue tracker on the
# archzfs github page.
#
#"

update_linux_lts_pkgbuilds() {
    pkg_list=("spl-utils-linux-lts" "spl-linux-lts" "zfs-utils-linux-lts" "zfs-linux-lts")
    kernel_version_full=$(kernel_version_full ${kernel_version})
    kernel_version_full_pkgver=$(kernel_version_full_no_hyphen ${kernel_version})
    kernel_version_major=${kernel_version%-*}
    kernel_mod_path="${kernel_version_full}-lts"
    archzfs_package_group="archzfs-linux-lts"
    spl_pkgver=${zol_version}_${kernel_version_full_pkgver}
    zfs_pkgver=${zol_version}_${kernel_version_full_pkgver}
    spl_pkgrel=${pkgrel}
    zfs_pkgrel=${pkgrel}
    spl_utils_pkgname="spl-utils-linux-lts"
    spl_pkgname="spl-linux-lts"
    zfs_utils_pkgname="zfs-utils-linux-lts"
    zfs_pkgname="zfs-linux-lts"
    spl_utils_pkgbuild_path="packages/${kernel_name}/${spl_utils_pkgname}"
    spl_pkgbuild_path="packages/${kernel_name}/${spl_pkgname}"
    zfs_utils_pkgbuild_path="packages/${kernel_name}/${zfs_utils_pkgname}"
    zfs_pkgbuild_path="packages/${kernel_name}/${zfs_pkgname}"
    spl_src_target="http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/spl-${zol_version}.tar.gz"
    zfs_src_target="http://archive.zfsonlinux.org/downloads/zfsonlinux/zfs/zfs-${zol_version}.tar.gz"
    spl_workdir="\${srcdir}/spl-${zol_version}"
    zfs_workdir="\${srcdir}/zfs-${zol_version}"
    linux_depends="\"linux-lts>=${kernel_version_major}\" \"linux-lts<${kernel_version_next}\""
    linux_headers_depends="\"linux-lts-headers>=${kernel_version_major}\" \"linux-lts-headers<${kernel_version_next}\""
}
