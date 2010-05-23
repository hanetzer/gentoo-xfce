# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit flag-o-matic xfce4

xfce4_apps

DESCRIPTION="Calendar suite for Xfce4"
HOMEPAGE="http://www.xfce.org/projects/orage/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="berkdb dbus debug libnotify"

RDEPEND=">=x11-libs/gtk+-2.10:2
	>=dev-libs/libical-0.43
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-base/xfce4-panel-${XFCE_VERSION}
	berkdb? ( >=sys-libs/db-4 )
	libnotify? ( x11-libs/libnotify )
	dbus? ( dev-libs/dbus-glib )"
DEPEND="${RDEPEND}
	dev-util/intltool"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable dbus) $(use_enable libnotify)
	$(use_with berkdb bdb4)"
}

src_configure() {
	append-flags -I/usr/include/libical
	xfce4_src_configure
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
