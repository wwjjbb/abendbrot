# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="libretro implementation of PCSX ReARMed. (PlayStation)"
HOMEPAGE="https://github.com/libretro/pcsx_rearmed"
SRC_URI=""

EGIT_REPO_URI="https://github.com/libretro/pcsx_rearmed.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="sys-libs/zlib"
DEPEND=""

src_prepare() {
	git-r3_fetch https://github.com/libretro/libretro-super.git HEAD 
	git-r3_checkout https://github.com/libretro/libretro-super.git \
		"${WORKDIR}"/infos
	git-r3_checkout
}

src_configure() {
	./configure --platform=libretro
}

src_install() {
	insinto /usr/$(get_libdir)/libretro
	newins "${S}"/libretro.so pcsx_rearmed_libretro.so
	doins "${WORKDIR}"/infos/dist/info/pcsx_rearmed_libretro.info
}