# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_apps

DESCRIPTION="A terminal emulator for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/terminal/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x64-solaris"
IUSE="dbus debug"

RDEPEND=">=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.14:2
	x11-libs/libX11
	>=x11-libs/vte-0.22.5
	>=xfce-base/exo-0.3.4
	dbus? ( >=dev-libs/dbus-glib-0.88 )"
DEPEND="${RDEPEND}
	dev-util/intltool"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--docdir=${EPREFIX}/usr/share/doc/${PF}
		$(use_enable dbus)"

	DOCS="AUTHORS HACKING NEWS README THANKS"
}
