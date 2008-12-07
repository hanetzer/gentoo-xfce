# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit git gnome2-utils eutils multilib

DESCRIPTION="A lightweight web browser based on webkit-gtk"
HOMEPAGE="http://www.twotoasts.de/index.php?/pages/midori_summary.html"
EGIT_REPO_URI="git://git.xfce.org/kalikiana/${PN}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls soup sqlite"

RDEPEND=">=dev-libs/glib-2.16:2
	dev-libs/libxml2
	gnome-base/librsvg
	net-libs/webkit-gtk
	>=x11-libs/gtk+-2.10:2
	soup? ( net-libs/libsoup )
	sqlite? ( dev-db/sqlite )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

pkg_setup() {
	ewarn "Midori is not yet in a too mature status, so expect some minor things to break"
}

src_compile() {
	# borrowed from openoffice
	JOBS=`echo "${MAKEOPTS}" | sed -e "s/.*-j\([0-9]\+\).*/\1/"`

	./waf \
		--prefix="/usr/" \
		--libdir="/usr/$(get_libdir)/" \
		$(use_enable nls) \
		$(use_enable soup libsoup) \
		$(use_enable sqlite) \
		configure || die "waf configure failed."
	./waf build -j ${JOBS} || die "waf build failed."
}

src_install() {
	./waf \
		--destdir="${D}" \
		--disable-docs \
		install || die "waf install failed."
	dodoc AUTHORS ChangeLog HACKING README TODO TRANSLATE
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
