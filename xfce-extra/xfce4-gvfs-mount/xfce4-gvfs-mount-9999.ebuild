# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-gvfs-mount/xfce4-gvfs-mount-0.0.4.ebuild,v 1.1 2009/08/24 10:03:55 ssuominen Exp $

EAPI=2
inherit xfce4

xfce4_panel_plugin

DESCRIPTION="Nice little mounter working with gvfs"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE="debug"

RDEPEND=">=dev-libs/dbus-glib-0.76
	>=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.12:2
	>=gnome-base/libglade-2.6
	>=xfce-base/libxfce4util-4.4
	>=xfce-base/libxfcegui4-4.4
	>=xfce-base/xfce4-panel-4.4"
DEPEND="${RDEPEND}
	dev-util/intltool"

DOCS="AUTHORS NEWS README"
