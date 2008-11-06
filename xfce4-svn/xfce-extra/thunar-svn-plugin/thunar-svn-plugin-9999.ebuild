# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit xfce4

ESVN_PROJECT=${PN}

xfce4_goodies

DESCRIPTION="Thunar subversion plugin"
DEPEND=">=dev-util/subversion-1.4"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

DOCS="AUTHORS ChangeLog NEWS README"
