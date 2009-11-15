# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-wmdock-plugin/xfce4-wmdock-plugin-0.3.2.ebuild,v 1.3 2009/08/26 10:22:50 fauli Exp $

EAPI=2
inherit xfce4

xfce4_panel_plugin

DESCRIPTION="a compatibility layer for running WindowMaker dockapps on Xfce4."
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-wmdock-plugin"
KEYWORDS="~amd64 ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.6:2
	>=xfce-base/xfce4-panel-4.3.99.1
	>=xfce-base/libxfcegui4-4.3.90.2
	>=xfce-base/libxfce4util-4.3.90.2
	>=x11-libs/libwnck-2.8.1"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/intltool"

src_prepare() {
	sed -i -e "/^ACLOCAL_AMFLAGS/d" Makefile.am
	echo panel-plugin/wmdock.desktop.in.in >> po/POTFILES.skip
	xfce4_src_prepare
}

DOCS="AUTHORS ChangeLog README TODO"
