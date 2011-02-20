# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit virtualx xfce4

xfce4_core

DESCRIPTION="File manager for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/thunar/ http://thunar.xfce.org/"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="dbus debug exif libnotify pcre startup-notification test +xfce_plugins_trash udev"

GVFS_DEPEND=">=gnome-base/gvfs-1.6.6-r1"
COMMON_DEPEND=">=xfce-base/exo-0.6
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.8
	>=xfce-base/libxfce4ui-4.8
	>=dev-lang/perl-5.6
	dbus? ( >=dev-libs/dbus-glib-0.88 )
	exif? ( >=media-libs/libexif-0.6.19 )
	libnotify? ( x11-libs/libnotify )
	pcre? ( >=dev-libs/libpcre-6 )
	startup-notification? ( x11-libs/startup-notification )
	udev? ( >=sys-fs/udev-145[extras] )
	xfce_plugins_trash? ( >=dev-libs/dbus-glib-0.88
	>=xfce-base/xfce4-panel-4.8 )"
RDEPEND="${COMMON_DEPEND}
	x11-misc/shared-mime-info
	dev-util/desktop-file-utils
	dbus? ( ${GVFS_DEPEND} )
	udev? ( ${GVFS_DEPEND}[gdu,udev] )
	xfce_plugins_trash? ( ${GVFS_DEPEND} )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	dev-util/gtk-doc
	sys-devel/gettext"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--docdir=${EPREFIX}/usr/share/doc/${PF}
		$(use_enable dbus)
		$(use_enable udev gudev)
		$(use_enable libnotify notifications)
		$(use_enable exif)
		$(use_enable pcre)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"

	if use xfce_plugins_trash; then
		XFCE_CONFIG+=" --enable-dbus"
	else
		XFCE_CONFIG+=" --disable-tpa-plugin"
	fi

	DOCS="AUTHORS FAQ HACKING NEWS README THANKS TODO"
}

src_test() {
	Xemake check || die
}
