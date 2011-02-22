# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
MY_PN=gtk-xfce-engine
inherit xfconf-live

DESCRIPTION="Xfce's GTK+ engine and themes"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S=${WORKDIR}/${MY_PN}-${PV}

pkg_setup() {
	XFCONF=(
		--disable-dependency-tracking
		--disable-static
		$(xfconf_use_debug)
		)

	DOCS="AUTHORS NEWS README"
}
