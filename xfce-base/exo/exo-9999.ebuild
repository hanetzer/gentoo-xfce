# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4 python

xfce4_core

DESCRIPTION="Extensions, widgets and framework library with session management support"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x64-solaris ~x86-solaris"
IUSE="debug hal libnotify python"

RDEPEND=">=dev-lang/perl-5.6
	dev-perl/URI
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.4.2
	libnotify? ( >=x11-libs/libnotify-0.4 )
	hal? ( >=sys-apps/hal-0.5.7 )
	python? ( >=dev-python/pygtk-2.4 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-static
		$(use_enable libnotify notifications)
		$(use_enable hal)
		$(use_enable python)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"
	DOCS="AUTHORS HACKING NEWS README THANKS TODO"
}

src_prepare() {
	rm -f py-compile
	ln -s $(type -P true) py-compile

	if [[ ${CHOST} == *-interix* ]] ; then
		# configure detects getmntent, which is false!
		export ac_cv_func_getmntent=no
	fi

	xfce4_src_prepare
}

pkg_postinst() {
	xfce4_pkg_postinst
	python_mod_optimize exo-0.5 pyexo.py
}

pkg_postrm() {
	xfce4_pkg_postrm
	python_mod_cleanup exo-0.5 pyexo.py
}
