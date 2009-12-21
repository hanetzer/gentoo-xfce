# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_apps

DESCRIPTION="Application finder"
HOMEPAGE="http://git.xfce.org/apps/tumbler/tree/"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.16:2
	dev-libs/dbus-glib"
DEPEND="${RDEPEND}
	dev-util/gtk-doc
	dev-util/intltool"

WANT_GTKDOCIZE="yes"

DOCS="AUTHORS ChangeLog NEWS README TODO"
