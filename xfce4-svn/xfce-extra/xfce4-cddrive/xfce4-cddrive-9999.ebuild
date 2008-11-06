# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit xfce4

xfce4_panel_plugin

DESCRIPTION="Panel plugin to open/close the CD-ROM drive tray"
KEYWORDS="~amd64 ~x86"
IUSE="cddb debug"

DEPEND=">=sys-apps/hal-0.5.8.1
	>=dev-libs/dbus-glib-0.71
	>=dev-libs/glib-2.12.4
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-extra/exo-${XFCE_VERSION}
	>=dev-libs/libcdio-0.76
	cddb? ( >=media-libs/libcddb-1.2.1 )"

XFCE_CONFIG="$(use_enable cddb) $(use_enable !debug final)"

DOCS="AUTHORS ChangeLog README THANKS TODO"
