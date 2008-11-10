# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

MY_PN="lib${PN}"
inherit xfce4 python

xfce4_core

DESCRIPTION="Extensions, widgets and framework library with session management support"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug hal libnotify python"

RDEPEND=">=dev-lang/perl-5.6
	dev-perl/URI
	>=dev-libs/glib-2.6:2
	net-libs/libwww
	>=x11-libs/gtk+-2.6:2
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	libnotify? ( x11-libs/libnotify )
	hal? ( sys-apps/hal )
	python? ( dev-python/pygtk )"
DEPEND="${RDEPEND}
	dev-util/intltool"

XFCE_CONFIG+=" $(use_enable python) $(use_enable libnotify notifications)
	$(use_enable hal)"

pkg_postinst() {
	xfce4_pkg_postinst
	python_mod_optimize /usr/lib*/python*/site-packages
}

pkg_postrm() {
	xfce4_pkg_postrm
	python_mod_cleanup /usr/lib*/python*/site-packages
}

DOCS="AUTHORS ChangeLog HACKING NEWS README THANKS TODO"
