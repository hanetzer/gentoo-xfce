# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="Xfce4 settings"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug keyboard libnotify nls sound"

RDEPEND=">=dev-libs/glib-2.12:2
	dev-libs/dbus-glib
	gnome-base/libglade
	>=x11-libs/gtk+-2.10:2
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libwnck
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/libxfce4ui-${XFCE_VERSION}
	>=xfce-base/xfconf-${XFCE_VERSION}
	!xfce-base/xfce-mcs-manager
	!xfce-base/xfce-mcs-plugins
	>=xfce-base/exo-0.3.92
	libnotify? ( x11-libs/libnotify )
	keyboard? ( x11-libs/libxklavier )
	sound? ( media-libs/libcanberra )"
DEPEND="${RDEPEND}
	dev-util/intltool
	x11-proto/inputproto
	x11-proto/xf86vidmodeproto"

XFCE_CONFIG+=" $(use_enable libnotify) $(use_enable nls)
	$(use_enable keyboard libxklavier) $(use_enable sound sound-settings)
	--enable-xcursor"

src_unpack() {
	xfce4_src_unpack
	echo "xfce4-settings-manager/xfce-text-renderer.c" >> "${S}"/po/POTFILES.in
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
