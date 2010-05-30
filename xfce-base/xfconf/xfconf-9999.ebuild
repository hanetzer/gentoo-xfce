# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit xfce4

xfce4_core

DESCRIPTION="Xfce configuration daemon and utilities"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~x64-solaris"
IUSE="debug -perl profile"

RDEPEND=">=dev-libs/dbus-glib-0.72
	>=dev-libs/glib-2.12:2
	>=xfce-base/libxfce4util-4.6
	perl? ( dev-perl/glib-perl )"
DEPEND="${RDEPEND}
	dev-lang/perl
	dev-util/gtk-doc
	perl? ( dev-perl/extutils-depends
		dev-perl/extutils-pkgconfig )"

WANT_GTKDOCIZE="yes"

pkg_setup() {
	XFCE_CONFIG+=" --disable-dependency-tracking
		--enable-maintainer-mode
		--disable-static
		--with-perl-options=INSTALLDIRS=vendor
		$(use_enable perl perl-bindings)
		--disable-gtk-doc
		--disable-gtk-doc-html
		--disable-gtk-doc-pdf
		$(use_enable debug checks)
		--with-html-dir=${EPREFIX}/usr/share/doc/${PF}/html"

	use profile && XFCE_CONFIG+=" --enable-profiling"

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
