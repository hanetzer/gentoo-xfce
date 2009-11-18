# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/parole/parole-0.1.91.ebuild,v 1.1 2009/10/30 15:03:29 darkside Exp $

EAPI=2
inherit xfce4

xfce4_apps

DESCRIPTION="a simple media player based on the GStreamer framework for the Xfce4 desktop"
HOMEPAGE="http://goodies.xfce.org/projects/applications/parole/"
KEYWORDS="~amd64"
IUSE="debug libnotify nsplugin taglib"

RDEPEND=">=x11-libs/gtk+-2.16:2
	>=dev-libs/glib-2.16:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfcegui4-4.6
	>=dev-libs/dbus-glib-0.70
	>=media-libs/gstreamer-0.10.11
	>=media-libs/gst-plugins-base-0.10.11
	media-plugins/gst-plugins-meta
	libnotify? ( >=x11-libs/libnotify-0.4.1 )
	nsplugin? ( net-libs/xulrunner:1.9 )
	taglib? ( >=media-libs/taglib-1.4 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc
	x11-proto/xproto"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable libnotify)
		$(use_enable nsplugin browser-plugin)
		$(use_enable taglib)"
}

DOCS="AUTHORS ChangeLog README THANKS TODO"
