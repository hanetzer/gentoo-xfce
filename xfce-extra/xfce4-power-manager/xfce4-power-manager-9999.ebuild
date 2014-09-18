# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-power-manager/xfce4-power-manager-1.4.0.ebuild,v 1.1 2014/09/16 11:12:16 ssuominen Exp $

EAPI=5
inherit linux-info multilib xfconf

DESCRIPTION="Power manager for the Xfce desktop environment"
HOMEPAGE="http://goodies.xfce.org/projects/applications/xfce4-power-manager"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug kernel_linux lxpanel networkmanager policykit systemd +xfce_plugins_power"

COMMON_DEPEND=">=dev-libs/dbus-glib-0.100.2
	>=dev-libs/glib-2.30
	>=sys-apps/dbus-1.6.18
	|| ( >=sys-power/upower-0.9.23 >=sys-power/upower-pm-utils-0.9.23-r2 )
	>=x11-libs/gtk+-2.24:2
	>=x11-libs/libnotify-0.7
	x11-libs/libX11
	>=x11-libs/libXrandr-1.2
	x11-libs/libXext
	>=xfce-base/xfconf-4.10
	>=xfce-base/libxfce4ui-4.10
	>=xfce-base/libxfce4util-4.10
	lxpanel? ( lxde-base/lxpanel )
	policykit? ( >=sys-auth/polkit-0.112 )
	xfce_plugins_power? ( >=xfce-base/xfce4-panel-4.10 )"
# USE="systemd" is for ensuring hibernate/suspend works by enforcing correct runtime -only dependencies
RDEPEND="${COMMON_DEPEND}
	networkmanager? ( net-misc/networkmanager )
	!systemd? ( || ( sys-power/pm-utils sys-power/upower-pm-utils ) )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	x11-proto/xproto"

pkg_setup() {
	if use kernel_linux; then
		CONFIG_CHECK="~TIMER_STATS"
		linux-info_pkg_setup
	fi

	XFCONF=(
		$(use_enable policykit polkit)
		$(use_enable networkmanager network-manager)
		$(use_enable xfce_plugins_power xfce4panel)
		$(use_enable lxpanel lxdepanel)
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS NEWS README TODO )
}
