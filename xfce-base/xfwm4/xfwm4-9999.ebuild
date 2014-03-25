# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfwm4/xfwm4-4.11.1.ebuild,v 1.1 2014/03/11 16:00:38 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="Window manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug dri startup-notification +xcomposite"

RDEPEND=">=dev-libs/glib-2.20
	>=x11-libs/gtk+-2.24:2
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/pango
	>=x11-libs/libwnck-2.30:1
	>=xfce-base/libxfce4util-4.10
	>=xfce-base/libxfce4ui-4.10
	>=xfce-base/xfconf-4.10
	dri? ( >=x11-libs/libdrm-2.4 )
	startup-notification? ( x11-libs/startup-notification )
	xcomposite? (
		x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXfixes
		)"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
		$(use_enable dri libdrm)
		$(use_enable startup-notification)
		--enable-xsync
		--enable-render
		--enable-randr
		$(use_enable xcomposite compositor)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog COMPOSITOR NEWS README TODO )
}
