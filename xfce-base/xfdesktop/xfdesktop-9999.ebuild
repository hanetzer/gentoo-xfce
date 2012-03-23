# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfdesktop/xfdesktop-4.9.0.ebuild,v 1.2 2012/03/23 21:31:02 angelos Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Desktop manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/xfdesktop/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug libnotify thunar"

RDEPEND=">=dev-libs/glib-2.20:2
	>=x11-libs/gtk+-2.24:2
	x11-libs/libSM
	>=x11-libs/libwnck-2.20:1
	x11-libs/libX11
	>=xfce-base/exo-0.6
	>=xfce-base/garcon-0.1.5
	>=xfce-base/libxfce4ui-4.9
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/xfconf-4.8
	libnotify? ( >=x11-libs/libnotify-0.7 )
	thunar? (
		>=xfce-base/thunar-1.2[dbus]
		>=dev-libs/dbus-glib-0.90
		)"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(use_enable thunar file-icons)
		$(use_enable thunar thunarx)
		$(use_enable libnotify notifications)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS README TODO )
}
