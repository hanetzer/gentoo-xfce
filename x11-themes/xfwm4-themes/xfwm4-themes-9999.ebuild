# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfconf-live

DESCRIPTION="Xfce's window manager themes"
HOMEPAGE="http://www.xfce.org/projects/xfwm4/"
EGIT_REPO_URI="git://git.xfce.org/art/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=xfce-base/xfwm4-${PV}"
DEPEND=""

RESTRICT="binchecks strip"

pkg_setup() {
	DOCS="AUTHORS ChangeLog README TODO"
}
