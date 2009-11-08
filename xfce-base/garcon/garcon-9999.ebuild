# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/garcon/garcon-0.1.0.ebuild,v 1.5 2009/10/28 20:15:06 fauli Exp $

EAPI=2
inherit xfce4

xfce4_libs

DESCRIPTION="a freedesktop.org compliant menu implementation based on GLib and GIO"
LICENSE="LGPL-2 FDL-1.1"
KEYWORDS="~amd64 ~hppa ~ppc ~x86 ~x86-fbsd"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.14:2
	>=x11-libs/gtk+-2.12:2"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc
	sys-devel/gettext"

WANT_GTKDOCIZE="yes"
XFCE_CONFIG+=" --disable-static"
DOCS="AUTHORS ChangeLog HACKING NEWS README STATUS TODO"
