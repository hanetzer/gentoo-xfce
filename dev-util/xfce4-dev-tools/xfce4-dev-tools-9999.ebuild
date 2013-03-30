# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/xfce4-dev-tools/xfce4-dev-tools-4.10.0.ebuild,v 1.9 2012/11/28 12:32:48 ssuominen Exp $

EAPI=5
inherit xfconf

DESCRIPTION="A set of scripts and m4/autoconf macros that ease build system maintenance"
HOMEPAGE="http://www.xfce.org/ http://foo-projects.org/~benny/projects/xfce4-dev-tools/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.24"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	DOCS=( AUTHORS ChangeLog HACKING NEWS README )
}

# Avoid running elibtoolize (bug #450452)
src_prepare() { :; }
