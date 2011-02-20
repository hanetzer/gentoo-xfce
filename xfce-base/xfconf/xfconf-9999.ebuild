# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Xfce's configuration storage system"
HOMEPAGE="http://www.xfce.org/projects/xfconf/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~x64-solaris"
IUSE="debug perl"

RDEPEND=">=dev-libs/dbus-glib-0.72
	>=dev-libs/glib-2.18:2
	>=xfce-base/libxfce4util-4.8
	perl? ( dev-perl/glib-perl )"
DEPEND="${RDEPEND}
	dev-util/gtk-doc
	dev-util/intltool
	sys-devel/gettext
	perl? ( dev-perl/extutils-depends
		dev-perl/extutils-pkgconfig )"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--enable-maintainer-mode
		--disable-static
		$(use_enable perl perl-bindings)
		$(use_enable debug checks)
		--with-perl-options=INSTALLDIRS=vendor
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html"

	DOCS="AUTHORS NEWS README TODO"
}

src_compile() {
	emake OTHERLDFLAGS="${LDFLAGS}" || die
}

src_install() {
	xfce4_src_install

	if use perl; then
		find "${ED}" -type f -name perllocal.pod -delete
		find "${ED}" -depth -mindepth 1 -type d -empty -delete
	fi
}
