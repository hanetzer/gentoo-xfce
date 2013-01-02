# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/libxfce4ui/libxfce4ui-4.10.0.ebuild,v 1.11 2012/11/28 12:28:16 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="Unified widgets and session management libraries for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/libxfce4"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug glade gtk3 startup-notification"

RDEPEND=">=dev-libs/glib-2.28
	>=x11-libs/gtk+-2.24:2
	x11-libs/libX11
	x11-libs/libICE
	x11-libs/libSM
	>=xfce-base/libxfce4util-4.10
	>=xfce-base/xfconf-4.10
	glade? ( dev-util/glade:3 )
	gtk3? ( >=x11-libs/gtk+-3.2:3 )
	startup-notification? ( x11-libs/startup-notification )
	!xfce-base/xfce-utils"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

pkg_setup() {
	XFCONF=(
		$(use_enable startup-notification)
		$(use_enable glade gladeui)
		$(use_enable gtk3)
		$(xfconf_use_debug)
		--with-vendor-info=Gentoo
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )
}
