# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2025-present ROCKNIX (https://github.com/ROCKNIX)

PKG_NAME="plymouth"
PKG_VERSION="24.004.60"
PKG_LICENSE="GPL"
PKG_SITE="https://www.freedesktop.org/wiki/Software/Plymouth"
PKG_URL="https://www.freedesktop.org/software/plymouth/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_INIT="toolchain gcc:init libpng"
PKG_DEPENDS_HOST="toolchain libpng"
PKG_LONGDESC="Boot splash screen based on Fedora's Plymouth code"

pre_configure_init() {
  # plymouth-lite dont support to build in subdirs
  cd ${PKG_BUILD}
    rm -rf .${TARGET_NAME}-init
}

makeinstall_init() {
  mkdir -p ${INSTALL}/usr/bin
    cp ply-image ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/splash
    find_file_path splash/splash.conf && cp ${FOUND_PATH} ${INSTALL}/splash
    find_file_path "splash/splash-*.png" && cp ${FOUND_PATH} ${INSTALL}/splash
}