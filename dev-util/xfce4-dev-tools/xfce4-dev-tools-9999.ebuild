# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit xfconf

DESCRIPTION="A set of scripts and m4/autoconf macros that ease build system maintenance"
HOMEPAGE="http://www.xfce.org/ http://foo-projects.org/~benny/projects/xfce4-dev-tools/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/glib-2.30"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	DOCS=( AUTHORS ChangeLog HACKING NEWS README )
}

# Avoid running elibtoolize (bug #450452)
src_prepare() { :; }
