# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils xfce4

xfce4_core

DESCRIPTION="Python bindings for Xfce4 desktop enviroment"
HOMEPAGE="http://pyxfce.xfce.org"

LICENSE="as-is"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=dev-python/pygtk-2.6
	>=x11-libs/gtk+-2.4:2
	>=xfce-base/libxfce4util-${XFCE_VERSION}
	>=xfce-base/libxfce4mcs-${XFCE_VERSION}
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-base/xfce4-panel-${XFCE_VERSION}
	>=xfce-base/xfce-mcs-manager-${XFCE_VERSION}"

XFCE_CONFIG+=" --enable-mighty-mouse"

src_unpack() {
	subversion_src_unpack

	epatch "${FILESDIR}/${PN}-enum-types-header.patch"
}

DOCS="AUTHORS ChangeLog NEWS README TODO*"
