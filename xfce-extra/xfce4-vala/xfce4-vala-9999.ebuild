# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-vala/xfce4-vala-4.6.0.ebuild,v 1.1 2009/09/11 18:05:53 darkside Exp $

EAPI=2
inherit xfce4

XFCE_CAT="bindings"
xfce4_uri

DESCRIPTION="Vala bindings for libxfce4util, libxfce4menu, xfconf, libxfcegui4, exo and libxfce4panel"
HOMEPAGE="http://wiki.xfce.org/vala-bindings/"
LICENSE="LGPL-2.1"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfce4menu-4.6
	>=xfce-base/xfconf-4.6
	>=xfce-base/exo-0.3.100
	>=xfce-base/xfce4-panel-4.6
	>=dev-lang/vala-0.7.1"

DOCS="AUTHORS NEWS README"
