# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit subversion toolchain-funcs

DESCRIPTION="a tool to view, mount and unmount GVFS mounts"
HOMEPAGE="http://www.uvena.de/"
ESVN_REPO_URI="http://svn.xfce.org/svn/goodies/${PN}/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND=">=x11-libs/gtk+-2.12:2"

src_compile() {
	JOBS=`echo "${MAKEOPTS}" | sed -e "s/.*-j\([0-9]\+\).*/\1/"`
	[ $JOBS -gt 0 ] && export JOBS

	export LINKFLAGS="${LDFLAGS}"
	export CC=$(tc-getCC)
	export AR=$(tc-getAR)

	./waf \
		--prefix="/usr/" \
		configure || die "waf configure failed"
	./waf build || die "waf build failed"
}

src_install() {
	./waf \
		--destdir="${D}" \
		install || die "waf install failed"
	dodoc AUTHORS ChangeLog NEWS README README.I18N TODO
}
