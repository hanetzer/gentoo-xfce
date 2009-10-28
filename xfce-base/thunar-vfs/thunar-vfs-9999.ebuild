# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit xfce4

xfce4_core

DESCRIPTION="Thunar virtual filesystem"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug"

RDEPEND="xfce-base/exo
	>=xfce-base/thunar-${THUNAR_VERSION}"
DEPEND="${RDEPEND}
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

DOCS="AUTHORS ChangeLog NEWS README THANKS"
