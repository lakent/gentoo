# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

MY_PN="${PN%-bin}"
MY_PV="$(ver_cut 1-2)"

DESCRIPTION="high-level, general-purpose programming language"
HOMEPAGE="https://www.jsoftware.com/"
SRC_URI="https://www.jsoftware.com/download/${MY_PN}${MY_PV}/install/${MY_PN}${PV}_linux64.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"


src_install() {
	insinto /usr/share/${MY_PN}/${MY_PV}/
	doins -r {system,tools,bin/icons,addons}

	insinto "/etc/${MY_PN}/${MY_PV}/"
	doins bin/{profile.ijs,profilex_template.ijs}

	newbin bin/jconsole ijconsole-${PV}
	dosym ijconsole-${PV} /usr/bin/ijconsole

	newlib.so bin/libj.so "libj.so.${PV}"
	dosym libj.so.${PV} /usr/$(get_libdir)/libj.so

	newlib.so bin/libgmp.so "libjgmp.so.${PV}"
	dosym libjgmp.so.${PV} /usr/$(get_libdir)/libjgmp.so
}
