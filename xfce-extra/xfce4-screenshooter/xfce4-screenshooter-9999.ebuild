# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit xfce4

xfce4_apps

DESCRIPTION="Xfce4 panel screenshooter plugin"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="debug"

DOCS="AUTHORS ChangeLog NEWS README"

RDEPEND=">=net-libs/libsoup-2.26.0"
DEPEND="${RDEPEND}"

src_unpack() {
	xfce4_src_unpack
	echo lib/exo-job.c >> po/POTFILES.skip
}
