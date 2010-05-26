# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Unified widgets library for Xfce4, a libxfcegui4 replacement"
HOMEPAGE="http://www.xfce.org/"

LICENSE="LGPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="debug glade startup-notification"

RDEPEND="x11-libs/libX11
	x11-libs/libICE
	x11-libs/libSM
	>=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/xfconf-4.6
	glade? ( dev-util/glade:3 )
	startup-notification? ( x11-libs/startup-notification )"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/gtk-doc
	dev-util/intltool"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable glade gladeui)
		--enable-keyboard-library
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
	DOCS="AUTHORS NEWS README THANKS TODO"
}
