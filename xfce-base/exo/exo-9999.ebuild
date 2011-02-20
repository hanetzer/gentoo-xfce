# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="python? 2"

inherit xfce4 python

xfce4_core

DESCRIPTION="Extensions, widgets and framework library with session management support"
HOMEPAGE="http://www.xfce.org/projects/exo/"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~x64-solaris ~x86-solaris"
IUSE="debug python"

RDEPEND=">=dev-lang/perl-5.6
	dev-perl/URI
	>=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.14:2
	>=xfce-base/libxfce4util-4.8
	python? ( >=dev-python/pygtk-2.4 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/gtk-doc
	sys-devel/gettext"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	if use python; then
		python_set_active_version 2
		python_pkg_setup
	fi

	XFCE_CONFIG+=" --disable-dependency-tracking
		--docdir=${EPREFIX}/usr/share/doc/${PF}
		--disable-static
		$(use_enable python)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"

	DOCS="AUTHORS HACKING NEWS README THANKS TODO"
}

src_prepare() {
	rm -f py-compile
	ln -s $(type -P true) py-compile

	xfce4_src_prepare
}

pkg_postinst() {
	xfce4_pkg_postinst
	use python && python_mod_optimize exo-0.6 pyexo.py
}

pkg_postrm() {
	xfce4_pkg_postrm
	use python && python_mod_cleanup exo-0.6 pyexo.py
}
