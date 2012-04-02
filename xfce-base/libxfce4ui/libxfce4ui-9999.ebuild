# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/libxfce4ui/libxfce4ui-4.9.1.ebuild,v 1.2 2012/03/31 05:50:09 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Unified widgets and session management libraries for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/libxfce4"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug glade startup-notification"

RDEPEND=">=dev-libs/glib-2.16
	>=x11-libs/gtk+-2.14:2
	x11-libs/libX11
	x11-libs/libICE
	x11-libs/libSM
	>=xfce-base/libxfce4util-4.9
	>=xfce-base/xfconf-4.9
	glade? ( dev-util/glade:3 )
	startup-notification? ( x11-libs/startup-notification )
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		$(use_enable startup-notification)
		$(use_enable glade gladeui)
		$(xfconf_use_debug)
		--with-vendor-info=Gentoo
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )
}
