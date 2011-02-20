# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_core

DESCRIPTION="A D-Bus service for applications to request thumbnails"
HOMEPAGE="http://www.xfce.org/"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.16
	>=dev-libs/dbus-glib-0.72
	>=sys-apps/dbus-1
	>=media-libs/libpng-1.2
	>=x11-libs/gtk+-2.14:2
	media-libs/freetype:2"
DEPEND="${RDEPEND}
	dev-util/gtk-doc
	dev-util/intltool"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	DOCS="AUTHORS ChangeLog NEWS README TODO"
	XFCONF="--disable-dependency-tracking
		--disable-static
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
}
