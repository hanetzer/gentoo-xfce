# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_apps

DESCRIPTION="Power manager for Xfce4"
HOMEPAGE="http://goodies.xfce.org/projects/applications/xfce4-power-manager"

KEYWORDS="~amd64 ~x86"
IUSE="debug doc networkmanager +plugins +policykit"

COMMON_DEPEND=">=x11-libs/gtk+-2.18:2
	>=dev-libs/glib-2.16:2
	>=dev-libs/dbus-glib-0.70
	>=xfce-base/xfconf-4.6
	>=xfce-base/libxfce4ui-4.7
	>=xfce-base/libxfce4util-4.6
	>=x11-libs/libnotify-0.4.1
	>=x11-libs/libXrandr-1.2
	x11-libs/libX11
	x11-libs/libXext
	sys-fs/udisks
	sys-power/upower
	plugins? ( >=xfce-base/xfce4-panel-4.6 )
	policykit? ( >=sys-auth/polkit-0.91 )"
RDEPEND="${COMMON_DEPEND}
	networkmanager? ( net-misc/networkmanager )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	x11-proto/xproto
	doc? ( dev-libs/libxslt )"

pkg_setup() {
	XFCE_CONFIG+=" $(use_enable policykit polkit)
		--disable-hal
		--enable-dpms
		$(use_enable networkmanager network-manager)
		$(use_enable plugins panel-plugins)
		$(use_enable doc xsltproc)"

	DOCS="AUTHORS ChangeLog NEWS README TODO"
}

pkg_postinst() {
	xfce4_pkg_postinst
	echo
	echo "Hint:"
	elog "Try launching with: exec ck-launch-session xfce4-session"
	elog "from .xinitrc and startx in case of privilege issues."
	echo
}
