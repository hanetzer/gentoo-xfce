# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
GTKDOCIZE="yes"
inherit xfconf-live

DESCRIPTION="Xfce's unified widgets library (deprecated: don't use this for future development)"
HOMEPAGE="http://www.xfce.org/projects/libraries/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~x64-solaris"
IUSE="debug glade startup-notification"

RDEPEND="gnome-base/libglade
	x11-libs/libSM
	x11-libs/libX11
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-4.8
	glade? ( dev-util/glade:3 )
	startup-notification? ( x11-libs/startup-notification )"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	dev-util/pkgconfig"

pkg_setup() {
	XFCONF=(
		--disable-dependency-tracking
		--disable-static
		$(use_enable startup-notification)
		$(use_enable glade gladeui)
		$(xfconf_use_debug)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	DOCS="AUTHORS NEWS"
}
