# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_goodies

DESCRIPTION="Port of notification daemon for Xfce Desktop Environment"
HOMEPAGE="http://goodies.xfce.org/projects/applications/notification-daemon-xfce"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.6:2
	>=x11-libs/gtk+-2.6:2
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=x11-libs/libsexy-0.1.3
	dev-libs/dbus-glib"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	!x11-misc/notification-daemon"

pkg_setup() {
	XFCE_CONFIG+=" --enable-gradient-look --disable-mcs-plugin"
}

DOCS="AUTHORS ChangeLog NEWS README"
