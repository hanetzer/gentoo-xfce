# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_core

DESCRIPTION="C++ bindings to Xfce desktop environment"
HOMEPAGE="http://xfc.xfce.org"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="doc debug examples"

RDEPEND="dev-lang/perl
	>=dev-libs/atk-1.9
	>=dev-libs/glib-2.6:2
	>=dev-libs/libsigc++-2.0.6
	>=gnome-base/libglade-2.4
	>=x11-libs/gtk+-2.6:2
	>=x11-libs/pango-1.8"
DEPEND="${RDEPEND}
	doc? ( >=app-doc/doxygen-1.3.2 )"

XFCE_CONFIG+=" $(use_enable debug tests) $(use_enable examples) $(use_enable examples demos)"

DOCS="AUTHORS ChangeLog NEWS README TODO"
