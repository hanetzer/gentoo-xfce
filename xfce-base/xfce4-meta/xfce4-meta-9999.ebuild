# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The Xfce Desktop Environment (meta package)"
HOMEPAGE="http://www.xfce.org/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS=""
IUSE="minimal +svg"

RDEPEND=">=x11-themes/gtk-engines-xfce-3:0
	x11-themes/hicolor-icon-theme
	>=xfce-base/xfce4-appfinder-4.12
	>=xfce-base/xfce4-panel-4.12
	>=xfce-base/xfce4-session-4.12
	>=xfce-base/xfce4-settings-4.12
	>=xfce-base/xfdesktop-4.12
	>=xfce-base/xfwm4-4.12
	!minimal? (
		media-fonts/dejavu
		virtual/freedesktop-icon-theme
		)
	svg? ( gnome-base/librsvg )"
