# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Window manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/xfwm4/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd
~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="debug startup-notification +xcomposite"

RDEPEND=">=dev-libs/glib-2.10:2
	>=x11-libs/gtk+-2.14:2
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXpm
	x11-libs/pango
	>=x11-libs/libwnck-2.22
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/libxfce4ui-4.8
	>=xfce-base/xfconf-4.8
	startup-notification? ( x11-libs/startup-notification )
	xcomposite? ( x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXfixes )"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

pkg_setup() {
	XFCE_CONFIG+=" --docdir="${EPREFIX}"/usr/share/doc/${PF}
		--disable-dependency-tracking
		$(use_enable startup-notification)
		--enable-xsync
		--enable-render
		--enable-randr
		$(use_enable xcomposite compositor)"

	DOCS="AUTHORS COMPOSITOR NEWS NOTES README TODO"
}
