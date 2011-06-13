# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/xfce4-dev-tools/xfce4-dev-tools-4.8.0.ebuild,v 1.7 2011/05/19 22:30:31 ssuominen Exp $

EAPI=4
inherit xfconf

DESCRIPTION="Xfce's build scripts and aclocal macros"
HOMEPAGE="http://www.xfce.org/ http://foo-projects.org/~benny/projects/xfce4-dev-tools/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

pkg_setup() {
	DOCS=( AUTHORS ChangeLog HACKING NEWS README )
}
