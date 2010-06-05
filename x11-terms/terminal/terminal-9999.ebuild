# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_apps

DESCRIPTION="Terminal for Xfce desktop environment, based on vte library."
HOMEPAGE="http://www.xfce.org/projects/terminal"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x64-solaris"
IUSE="dbus debug doc"

RDEPEND=">=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.14:2
	x11-libs/libX11
	>=x11-libs/vte-0.17.1
	>=xfce-base/exo-0.3.4
	dbus? ( >=dev-libs/dbus-glib-0.31 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	doc? ( dev-libs/libxslt )"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--docdir=${EPREFIX}/usr/share/doc/${PF}
		$(use_enable dbus)
		$(use_enable doc gen-doc)"
	DOCS="AUTHORS HACKING NEWS README THANKS TODO"
}
