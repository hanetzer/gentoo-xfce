# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit xfce4

xfce4_goodies

DESCRIPTION="Systray status icon for safe unmount/eject of volumes"
HOMEPAGE="http://goodies.xfce.org"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-extra/exo-${XFCE_VERSION}[hal]
	>=sys-apps/hal-0.5.9
	>=dev-libs/ghal-${XFCE_VERSION}
	dev-libs/dbus-glib"
DEPEND="${RDEPEND}
	dev-util/intltool"

DOCS="AUTHORS ChangeLog NEWS README TODO"
