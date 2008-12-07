# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit gnome2-utils eutils multilib

DESCRIPTION="A lightweight web browser based on webkit-gtk"
HOMEPAGE="http://www.twotoasts.de/index.php?/pages/midori_summary.html"
SRC_URI="http://goodies.xfce.org/releases/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls soup sqlite"

RDEPEND=">=dev-libs/glib-2.16:2
	dev-libs/libxml2
	gnome-base/librsvg
	net-libs/webkit-gtk
	>=x11-libs/gtk+-2.10:2
	soup? ( net-libs/libsoup:2.4 )
	sqlite? ( dev-db/sqlite )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )"

pkg_setup() {
	ewarn "Midori is not yet in a too mature status, so expect some minor things to break"
}

src_compile() {
	# borrowed from openoffice
	JOBS=`echo "${MAKEOPTS}" | sed -e "s/.*-j\([0-9]\+\).*/\1/"`

	local myconf
	use nls || myconf="--disable-nls"
	use soup || myconf+=" --disable-libsoup"
	use sqlite || myconf+=" --disable-sqlite"

	./waf \
		--prefix="/usr/" \
		--libdir="/usr/$(get_libdir)/" \
		${myconf} \
		configure || die "waf configure failed."
	./waf build -j ${JOBS} || die "waf build failed."
}

src_install() {
	./waf \
		--destdir="${D}" \
		install || die "waf install failed."
	rm -rf "${D}"/usr/share/doc/${PN}/
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
