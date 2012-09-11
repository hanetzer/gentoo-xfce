# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfconf/xfconf-4.10.0.ebuild,v 1.10 2012/09/09 14:31:12 armin76 Exp $

EAPI=4
inherit xfconf

DESCRIPTION="A simple client-server configuration storage and query system for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug perl"

RDEPEND=">=dev-libs/dbus-glib-0.98
	>=dev-libs/glib-2.24
	>=xfce-base/libxfce4util-4.10
	perl? ( dev-perl/glib-perl )"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext
	perl? (
		dev-perl/extutils-depends
		dev-perl/extutils-pkgconfig
		)"

pkg_setup() {
	XFCONF=(
		$(use_enable perl perl-bindings)
		$(xfconf_use_debug)
		$(use_enable debug checks)
		--with-perl-options=INSTALLDIRS=vendor
		--with-html-dir="${EPREFIX}"/usr/share/doc/${PF}/html
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS TODO )
}

src_compile() {
	emake OTHERLDFLAGS="${LDFLAGS}"
}

src_install() {
	xfconf_src_install

	if use perl; then
		find "${ED}" -type f -name perllocal.pod -exec rm -f {} +
		find "${ED}" -depth -mindepth 1 -type d -empty -exec rm -rf {} +
	fi
}
