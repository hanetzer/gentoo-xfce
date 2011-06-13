# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfdesktop/xfdesktop-4.8.2.ebuild,v 1.3 2011/05/19 22:07:28 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Desktop manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/xfdesktop/"

LICENSE="GPL-2"
SLOT="0"
# XXX: Don't mark this ebuild stable because of fake transparency problems, stay with 4.8.1 instead
KEYWORDS=""
IUSE="debug libnotify thunar"

RDEPEND="x11-libs/libX11
	x11-libs/libSM
	>=x11-libs/libwnck-2.22:1
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/libxfce4ui-4.8
	>=xfce-base/garcon-0.1.5
	>=xfce-base/xfconf-4.8
	libnotify? ( >=x11-libs/libnotify-0.4 )
	thunar? ( >=xfce-base/exo-0.6
		>=xfce-base/thunar-1.2
		>=dev-libs/dbus-glib-0.88 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext
	xfce-base/exo"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		--disable-static
		$(use_enable thunar file-icons)
		$(use_enable thunar thunarx)
		$(use_enable thunar exo)
		$(use_enable libnotify notifications)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog NEWS README TODO )
}
