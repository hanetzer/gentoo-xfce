# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN=${PN/-freq/freq}

inherit eutils xfce4

xfce4_panel_plugin

DESCRIPTION="A panel plugin for showing information about cpufreq settings"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

src_unpack() {
	xfce4_src_unpack
	epatch "${FILESDIR}"/${PN}-compile-fix.patch
	echo "panel-plugin/xfce4-cpufreq-configure.c" >> "${S}"/po/POTFILES.in
	echo "panel-plugin/xfce4-cpufreq-linux.c" >> "${S}"/po/POTFILES.in
	echo "panel-plugin/xfce4-cpufreq-overview.c" >> "${S}"/po/POTFILES.in
}

DOCS="AUTHORS ChangeLog NEWS README"
