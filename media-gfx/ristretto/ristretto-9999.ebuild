# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_apps

DESCRIPTION="Image viewer and browser for Xfce4"
HOMEPAGE="http://goodies.xfce.org/projects/applications/ristretto"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug"

RDEPEND=">=media-libs/libexif-0.6
	>=x11-libs/gtk+-2.12:2
	>=dev-libs/glib-2.16:2
	>=dev-libs/dbus-glib-0.34
	>=x11-libs/cairo-1.8
	>=xfce-base/libxfcegui4-4.6
	>=xfce-base/libxfce4util-4.6
	xfce? ( >=xfce-base/xfconf-4.6 )"
DEPEND="${RDEPEND}
	dev-util/intltool"

DOCS="AUTHORS ChangeLog NEWS README TODO"
