# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Meta ebuild for panel plugins and extra applications"
HOMEPAGE="http://www.xfce.org"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="battery cpufreq hal gnome lm_sensors wifi"

RDEPEND="~xfce-extra/xfce4-time-out-plugin-9999
	~xfce-extra/xfce4-clipman-plugin-9999
	~xfce-extra/xfce4-datetime-plugin-9999
	~xfce-extra/xfce4-dict-9999
	~xfce-extra/xfce4-mount-plugin-9999
	~xfce-extra/xfce4-notes-plugin-9999
	~xfce-extra/xfce4-quicklauncher-plugin-9999
	~xfce-extra/xfce4-screenshooter-9999
	~xfce-extra/xfce4-systemload-plugin-9999
	~xfce-extra/xfce4-weather-plugin-9999
	~xfce-extra/xfce4-xkb-plugin-9999
	~xfce-extra/xfce4-netload-plugin-9999
	~xfce-extra/xfce4-fsguard-plugin-9999
	~xfce-extra/xfce4-cpugraph-plugin-9999
	~xfce-extra/xfce4-taskmanager-9999
	~xfce-extra/xfce4-timer-plugin-9999
	~xfce-extra/xfce4-diskperf-plugin-9999
	~xfce-extra/xfce4-genmon-plugin-9999
	~xfce-extra/xfce4-smartbookmark-plugin-9999
	~xfce-extra/xfce4-mailwatch-plugin-9999
	~xfce-extra/xfce4-places-plugin-9999
	~xfce-extra/xfce4-eyes-plugin-9999
	~xfce-extra/xfce4-verve-plugin-9999
	~xfce-extra/thunar-thumbnailers-9999
	~xfce-extra/thunar-archive-plugin-9999
	~xfce-extra/thunar-media-tags-plugin-9999
	hal? ( ~xfce-extra/thunar-volman-9999 )
	cpufreq? ( ~xfce-extra/xfce4-cpu-freq-plugin-9999 )
	gnome? ( ~xfce-extra/xfce4-xfapplet-plugin-9999 )
	battery? ( ~xfce-extra/xfce4-battery-plugin-9999 )
	wifi? ( ~xfce-extra/xfce4-wavelan-plugin-9999 )
	lm_sensors? ( ~xfce-extra/xfce4-sensors-plugin-9999 )"
