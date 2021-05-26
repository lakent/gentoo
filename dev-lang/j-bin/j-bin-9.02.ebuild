# Copyright 1990-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=7


MY_PN="${PN%-bin}"
MY_PV=$(ver_rs 1 '')
MY_P="${MY_PN}${MY_PV}"

DESCRIPTION="high-level, general-purpose programming language"
HOMEPAGE="https://www.jsoftware.com/"
SRC_URI="http://www.jsoftware.com/download/${MY_P}/install/${MY_P}_linux64.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm arm64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

QA_PREBUILT="*"

src_install() {
    insinto /usr/share/${MY_PN}/${PV}/
    doins -r {system,tools,bin/icons,addons}

    insinto "/etc/${MY_PN}/${PV}/"
    doins bin/{profile.ijs,profilex_template.ijs}

    echo "#!/bin/bash" >ijconsole.sh
    echo "cd ~ && /usr/bin/ijconsole \"$@\"" >>ijconsole.sh
    dobin ijconsole.sh
    newbin bin/jconsole ijconsole-${PV}
    dosym ijconsole-${PV} /usr/bin/ijconsole

    newlib.so bin/libj.so "libj.so.${PV}"
    dosym libj.so.${PV} /usr/lib64/libj.so
}