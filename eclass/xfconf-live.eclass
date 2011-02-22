# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# @ECLASS: xfconf-live.eclass
# @MAINTAINER: Christoph Mende <angelos@gentoo.org>
# Gentoo's Xfce Team <xfce@gentoo.org>
# @BLURB: Default XFCE ebuild layout
# @DESCRIPTION:
# Default XFCE ebuild layout

if [[ "${PN}" != "xfce4-dev-tools" ]]; then
	EAUTORECONF="yes"
fi

inherit git xfconf

SRC_URI=""
EGIT_REPO_URI="git://git.xfce.org/xfce/${MY_PN:-${PN}}"
EGIT_BOOTSTRAP="autogen.sh"
export NOCONFIGURE="yes"

if [[ "${GTKDOCIZE}" == "yes" ]]; then
	_xfce4_gtkdocize="dev-util/gtk-doc"
fi

DEPEND+="
	${_xfce4_gtkdocize}"

unset _xfce4_gtkdocize

EXPORT_FUNCTIONS src_unpack src_prepare src_configure src_install pkg_preinst pkg_postinst pkg_postrm

# @FUNCTION: xfconf_src_prepare
# @DESCRIPTION:
# Patch autogen.sh in live ebuilds to inject the correct revision into
# configure.ac
xfconf-live_src_prepare() {
	debug-print-function ${FUNCNAME} "$@"
	base_src_prepare
	git_src_prepare
	return
}

xfconf-live_src_unpack() {
	git_src_unpack "$@"
}

xfconf-live_src_configure() {
	XFCONF=( --enable-maintainer-mode ${XFCONF[@]} )
	xfconf_src_configure "$@"
}

xfconf-live_src_install() {
	xfconf_src_install "$@"
}

xfconf-live_pkg_preinst() {
	xfconf_pkg_preinst "$@"
}

xfconf-live_pkg_postinst() {
	xfconf_pkg_postinst "$@"
}

xfconf-live_pkg_postrm() {
	xfconf_pkg_postrm "$@"
}
