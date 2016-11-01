# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Arc Dark cusomization for Plasma 5 "
HOMEPAGE="https://github.com/varlesh/Arc-Dark-KDE"
SRC_URI=""
EGIT_REPO_URI="git://github.com/varlesh/Arc-Dark-KDE.git"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-themes/papirus-icon-theme-kde"
RDEPEND="${DEPEND}"

pkg_postinst() {
	elog ""
	elog "This theme optionally supports \"x11-themes/kvantum\""
	elog "See also \"x11-themes/gtk-themes-arc\" for gtk support"
	elog ""
}
