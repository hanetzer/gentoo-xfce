# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit virtualx xfce4

xfce4_core

DESCRIPTION="File manager for Xfce4"
HOMEPAGE="http://thunar.xfce.org/"

LICENSE="GPL-2 LGPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="dbus debug exif pcre startup-notification test +trash-plugin"

COMMON_DEPEND=">=xfce-base/exo-0.5.1
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfce4ui-4.7.1
	>=dev-lang/perl-5.6
	dbus? ( dev-libs/dbus-glib )
	exif? ( >=media-libs/libexif-0.6.19 )
	pcre? ( >=dev-libs/libpcre-6 )
	startup-notification? ( x11-libs/startup-notification )
	trash-plugin? ( dev-libs/dbus-glib
		>=xfce-base/xfce4-panel-4.3.90 )"
RDEPEND="${COMMON_DEPEND}
	>=x11-misc/shared-mime-info-0.70
	>=dev-util/desktop-file-utils-0.15"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		$(use_enable dbus)
		$(use_enable exif)
		$(use_enable pcre)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"

	if use trash-plugin; then
		XFCE_CONFIG+=" --enable-dbus"
	else
		XFCE_CONFIG+=" --disable-tpa-plugin"
	fi

	DOCS="AUTHORS ChangeLog FAQ HACKING NEWS README THANKS TODO"
}

src_test() {
	Xemake check || die
}

pkg_postinst() {
	xfce4_pkg_postinst

	echo
	elog "If you are seeing some odd dbus error, make sure your user is in the"
	elog "plugdev group. See Gentoo bug #279077 for more info"
	echo
}
