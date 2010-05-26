# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_apps

DESCRIPTION="A simple text editor for Xfce"
HOMEPAGE="http://www.xfce.org/projects/mousepad/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.6:2
	>=xfce-base/libxfcegui4-4.4"
DEPEND="${RDEPEND}
	dev-util/intltool"

DOCS="AUTHORS ChangeLog NEWS README TODO"
