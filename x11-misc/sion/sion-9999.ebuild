# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_goodies

DESCRIPTION="a tool to view, mount and unmount GVFS mounts"
HOMEPAGE="http://www.uvena.de/"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.12:2"

DOCS="AUTHORS ChangeLog NEWS README README.I18N TODO"
