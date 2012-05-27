# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/xfce4-dev-tools/xfce4-dev-tools-4.9.2.ebuild,v 1.2 2012/05/05 02:18:51 jdhore Exp $

EAPI=4
inherit xfconf

DESCRIPTION="A set of scripts and m4/autoconf macros that ease build system maintenance"
HOMEPAGE="http://www.xfce.org/ http://foo-projects.org/~benny/projects/xfce4-dev-tools/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.18"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	DOCS=( AUTHORS ChangeLog HACKING NEWS README )
}
