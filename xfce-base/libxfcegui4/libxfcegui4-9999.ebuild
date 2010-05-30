# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Unified widgets library for Xfce4"
HOMEPAGE="http://www.xfce.org/projects/libraries"

LICENSE="LGPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~x64-solaris"
IUSE="debug glade startup-notification"

RDEPEND="gnome-base/libglade
	x11-libs/libSM
	x11-libs/libX11
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/xfconf-4.6
	glade? ( dev-util/glade:3 )
	startup-notification? ( x11-libs/startup-notification )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-static
		$(use_enable glade gladeui)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
	DOCS="AUTHORS NEWS README TODO"
}
