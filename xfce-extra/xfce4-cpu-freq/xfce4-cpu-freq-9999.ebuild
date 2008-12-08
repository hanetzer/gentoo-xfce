# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN=${PN/-freq/freq}

inherit xfce4

xfce4_panel_plugin

DESCRIPTION="A panel plugin for showing information about cpufreq settings"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DOCS="AUTHORS ChangeLog NEWS README"
