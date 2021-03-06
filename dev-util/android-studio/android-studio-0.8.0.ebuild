# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

BUILD_VERSION="135.1245622"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="A new Android development environment based on IntelliJ IDEA"
HOMEPAGE="http://developer.android.com/sdk/installing/studio.html"
SRC_URI="http://dl.google.com/android/studio/install/${PV}/${PN}-bundle-${BUILD_VERSION}-linux.tgz"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~amd64"

RDEPEND=">=virtual/jdk-1.6"
S=${WORKDIR}/${PN}

src_install() {
	local dir="/opt/${PN}"
	local exe="${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/studio.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"

	newicon "bin/idea.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${PN}/bin/studio.sh"
	make_desktop_entry ${exe} "Android Studio" "${exe}" "Development;IDE"
}
