# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_core

DESCRIPTION="Session manager for Xfce4"
HOMEPAGE="http://www.xfce.org/projects/xfce4-session/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="+consolekit debug fortune gnome gnome-keyring +upower"

RDEPEND=">=dev-libs/dbus-glib-0.73
	>=x11-libs/gtk+-2.14:2
	>=x11-libs/libwnck-2.22
	>=xfce-base/libxfce4ui-4.7
	>=xfce-base/libxfce4util-4.7
	>=xfce-base/xfce4-panel-4.6
	>=xfce-base/xfconf-4.7
	consolekit? ( sys-auth/consolekit
		sys-auth/polkit )
	fortune? ( games-misc/fortune-mod )
	gnome? ( >=gnome-base/gconf-2.4 )
	gnome-keyring? ( >=gnome-base/gnome-keyring-2.22 )
	upower? ( sys-power/upower
		sys-auth/polkit )"
DEPEND="${RDEPEND}
	dev-util/intltool"

pkg_setup() {
	XFCE_CONFIG+=" --disable-hal
		--enable-panel-plugin
		$(use_enable consolekit)
		$(use_enable gnome)
		$(use_enable gnome-keyring libgnome-keyring)
		$(use_enable upower)"

	if use consolekit || use upower; then
		XFCE_CONFIG+=" --enable-polkit"
	fi

	DOCS="AUTHORS BUGS NEWS README TODO"
}

src_install() {
	xfce4_src_install

	if ! use fortune; then
		# Wipe away unusable xfce4-tips
		rm -Rf "${D}"/usr/share/xfce4/tips
		rm -f "${D}"/usr/bin/xfce4-tips \
			"${D}"/usr/lib/debug/usr/bin/xfce4-tips.debug \
			"${D}"/etc/xdg/autostart/xfce4-tips-autostart.desktop
		rmdir "${D}"/etc/xdg/autostart
	fi
}

pkg_postinst() {
	if ! use consolekit || ! use upower; then
		einfo "consolekit or upower is disabled, you will need sudo to"
		einfo "shutdown/suspend as user."
		einfo "Please add the following to your sudoers file:"
		einfo "myuser        myhost=${EPREFIX}/usr/libexec/xfsm-shutdown-helper"
		einfo "Where myuser is your user and myhost your hostname"
	fi
}
