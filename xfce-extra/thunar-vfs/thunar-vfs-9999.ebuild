# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Xfce's filesystem libraries (deprecated: don't use this for future development)"
HOMEPAGE="http://git.xfce.org/xfce/thunar-vfs/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="dbus debug gnome startup-notification"

RDEPEND=">=xfce-base/exo-0.6
	>=dev-libs/glib-2.12:2
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-4.8
	>=media-libs/libpng-1.4
	>=media-libs/freetype-2
	virtual/fam
	virtual/jpeg
	dbus? ( >=dev-libs/dbus-glib-0.88 )
	gnome? ( >=gnome-base/gconf-2 )
	startup-notification? ( >=x11-libs/startup-notification-0.4 )
	!<xfce-base/thunar-1.1.0"
DEPEND="${RDEPEND}
	dev-util/gtk-doc
	dev-util/intltool
	sys-devel/gettext
	dev-lang/perl"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		$(use_enable dbus)
		$(use_enable gnome gnome-thumbnailers)
		$(use_enable startup-notification)
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		--with-volume-manager=none"

	DOCS="AUTHORS HACKING NEWS README TODO"
}

src_install() {
	xfce4_src_install \
		docdir="${EPREFIX}"/usr/share/doc/${PF}
}
