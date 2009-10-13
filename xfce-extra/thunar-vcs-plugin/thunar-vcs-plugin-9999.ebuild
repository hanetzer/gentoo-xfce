# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit xfce4

xfce4_thunar_plugin

DESCRIPTION="Thunar subversion plugin"
DEPEND=">=dev-util/subversion-1.5
		>=dev-libs/apr-0.9.7"

KEYWORDS="~amd64 ~x86"
IUSE="debug"

DOCS="AUTHORS ChangeLog NEWS README"
