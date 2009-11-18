# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit xfce4

xfce4_panel_plugin

DESCRIPTION="panel plugin that keeps track of elapsed time"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-stopwatch-plugin"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-2.10:2
	>=xfce-base/libxfce4util-4.6
	>=xfce-base/libxfcegui4-4.6
	>=xfce-base/xfce4-panel-4.6
	>=xfce-extra/xfce4-vala-4.6"
DEPEND="${RDEPEND}
	dev-util/intltool"

DOCS="AUTHORS NEWS"
