# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfconf-live

DESCRIPTION="Icon theme called Rodent"
HOMEPAGE="http://www.xfce.org/"
EGIT_REPO_URI="git://git.xfce.org/art/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE="minimal"

RDEPEND="x11-themes/hicolor-icon-theme
	!minimal? ( || ( x11-themes/tango-icon-theme x11-themes/gnome-icon-theme ) )"
DEPEND="dev-util/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

RESTRICT="binchecks strip"
