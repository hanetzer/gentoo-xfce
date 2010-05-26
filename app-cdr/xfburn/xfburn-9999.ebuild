# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_apps

DESCRIPTION="GTK+ based CD and DVD burning application"
HOMEPAGE="http://goodies.xfce.org/projects/applications/xfburn"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="dbus debug gstreamer +xfce"

RDEPEND=">=dev-libs/libburn-0.4.2
	>=dev-libs/libisofs-0.6.2
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfcegui4-4.4
	>=xfce-base/exo-0.3
	dbus? ( dev-libs/dbus-glib )
	gstreamer? ( media-libs/gstreamer
		>=media-libs/gst-plugins-base-0.10.20 )
	xfce? ( xfce-extra/thunar-vfs )"
DEPEND="${RDEPEND}
	dev-util/intltool"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable dbus)
		$(use_enable gstreamer)
		$(use_enable xfce thunar-vfs)
		--disable-hal"
	DOCS="AUTHORS ChangeLog NEWS README TODO"
}
