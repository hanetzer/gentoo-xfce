# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit xfconf

DESCRIPTION="A simple client-server configuration storage and query system for the Xfce desktop environment"
HOMEPAGE="http://www.xfce.org/projects/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug perl"

RDEPEND=">=dev-libs/dbus-glib-0.98
	>=dev-libs/glib-2.30
	>=xfce-base/libxfce4util-4.10
	perl? (
		dev-lang/perl:=[-build(-)]
		dev-perl/glib-perl
	)"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext
	perl? (
		dev-perl/ExtUtils-Depends
		dev-perl/extutils-pkgconfig
	)"

pkg_setup() {
	XFCONF=(
		$(use_enable perl perl-bindings)
		$(xfconf_use_debug)
		$(use_enable debug checks)
		--with-perl-options=INSTALLDIRS=vendor
		)

	[[ ${CHOST} == *-darwin* ]] && XFCONF+=( --disable-visibility ) #366857

	DOCS=( AUTHORS ChangeLog NEWS TODO )
}

src_prepare() {
	# https://bugzilla.xfce.org/show_bug.cgi?id=9556
	cat <<-EOF >> po/POTFILES.skip
	xfconf-perl/xs/Xfconf.c
	xfconf-perl/xs/XfconfBinding.c
	xfconf-perl/xs/XfconfChannel.c
	EOF
	xfconf_src_prepare
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
