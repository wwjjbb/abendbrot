# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit libretro-core

DESCRIPTION="libretro implementation of FCEUmm/FCEUX. (Nintendo Entertainment System)"
HOMEPAGE="https://github.com/libretro/fceu-next"
SRC_URI=""

EGIT_REPO_URI="https://github.com/libretro/fceu-next.git"
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

S="${S}/fceumm-code"
LIBRETRO_CORE_NAME=fceumm

src_compile() {
	emake -f Makefile.libretro
}

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		ewarn ""
		ewarn "You need to have the following files in your 'system_directory' folder:"
		ewarn "disksys.rom (Famicom Disk System BIOS)"
		ewarn ""
		ewarn "This message will only be displayed once!"
		ewarn ""
	fi
}
