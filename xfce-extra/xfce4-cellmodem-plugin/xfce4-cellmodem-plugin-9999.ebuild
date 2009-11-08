# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-cellmodem-plugin/xfce4-cellmodem-plugin-0.0.5.ebuild,v 1.1 2009/08/25 10:23:47 ssuominen Exp $

EAPI=2
inherit xfce4

xfce4_panel_plugin

DESCRIPTION="Panel plugin for monitoring cellular modems - GPRS/UMTS(3G)/HSDPA(3.5G)"
HOMEPAGE="http://www.xfce.org/"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=xfce-base/xfce4-panel-4.3.20
	sys-apps/pciutils[zlib]
	=virtual/libusb-0*"
DEPEND="${RDEPEND}
	dev-util/intltool"

src_prepare() {
	echo panel-plugin/cellmodem.desktop.in.in >> po/POTFILES.skip
	echo panel-plugin/sms_dialog.c >> po/POTFILES.skip
	xfce4_src_prepare
}

DOCS="AUTHORS ChangeLog README"
