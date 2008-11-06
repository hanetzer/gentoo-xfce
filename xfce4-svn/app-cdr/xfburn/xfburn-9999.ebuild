# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit xfce4

xfce4_goodies

DESCRIPTION="GTK+ based CD and DVD burning application"
HOMEPAGE="http://www.xfce.org/projects/xfburn"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="+dbus debug hal +xfce"

RDEPEND=">=dev-libs/libburn-0.3
	>=dev-libs/libisofs-0.6.2
	>=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfcegui4-${XFCE_VERSION}
	>=xfce-extra/exo-${XFCE_VERSION}
	xfce? ( >=xfce-base/thunar-${XFCE_VERSION} )
	dbus? ( dev-libs/dbus-glib )
	hal? ( sys-apps/hal )"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext"

XFCE_CONFIG+="$(use_enable xfce thunar-vfs) \
		$(use_enable dbus) $(use_enable hal) \
		--enable-final"

DOCS="AUTHORS ChangeLog NEWS README TODO"
