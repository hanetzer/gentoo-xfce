# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_core

DESCRIPTION="Settings daemon for Xfce4"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="debug +keyboard libnotify sound"

RDEPEND=">=dev-libs/glib-2.16:2
	>=dev-libs/dbus-glib-0.34
	>=gnome-base/libglade-2
	>=x11-libs/gtk+-2.14:2
	>=x11-libs/libX11-1
	>=x11-libs/libXcursor-1.1
	>=x11-libs/libXi-1.3
	>=x11-libs/libXrandr-1.1
	>=x11-libs/libwnck-2.12
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfce4ui-4.7
	>=xfce-base/xfconf-4.6
	>=xfce-base/exo-0.5
	!<x11-base/xorg-server-1.5.3
	libnotify? ( >=x11-libs/libnotify-0.1.3 )
	keyboard? ( >=x11-libs/libxklavier-0.3 )
	sound? ( media-libs/libcanberra )"
DEPEND="${RDEPEND}
	dev-util/intltool
	x11-proto/inputproto
	x11-proto/xf86vidmodeproto"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--disable-static
		$(use_enable libnotify)
		$(use_enable keyboard libxklavier)
		$(use_enable sound sound-settings)"
	DOCS="AUTHORS ChangeLog NEWS README TODO"
}
