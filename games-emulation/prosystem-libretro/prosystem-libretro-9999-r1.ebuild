# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit libretro-core

DESCRIPTION="libretro implementation of prosystem. (Atari 7800)"
HOMEPAGE="https://github.com/libretro/prosystem-libretro"
SRC_URI=""

EGIT_REPO_URI="https://github.com/libretro/prosystem-libretro.git"
if [[ ${PV} == 9999 ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT_DATE="${PV:7:4}-${PV:11:2}-${PV:13:2}"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		ewarn ""
		ewarn "You need to have the following files in your 'system_directory' folder:"
		ewarn "ProSystem.dat (Atari 7800 Database)"
		ewarn "7800 BIOS (U).rom (Atari 7800 BIOS)"
		ewarn ""
		ewarn "This message will only be displayed once!"
		ewarn ""
	fi
}
