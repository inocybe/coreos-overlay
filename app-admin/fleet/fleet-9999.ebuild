# Copyright (c) 2014 CoreOS, Inc.. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
CROS_WORKON_PROJECT="coreos/fleet"
CROS_WORKON_LOCALNAME="fleet"
CROS_WORKON_REPO="git://github.com"

if [[ "${PV}" == 9999 ]]; then
	KEYWORDS="~amd64"
else
	CROS_WORKON_COMMIT="31bb88edd09161064eb8f29c114f7e41806a5aea"  # tag v0.1.3
	KEYWORDS="amd64"
fi

inherit cros-workon systemd

DESCRIPTION="fleet"
HOMEPAGE="https://github.com/coreos/fleet"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=">=dev-lang/go-1.2"

src_compile() {
	./build || die
}

src_install() {
	dobin ${S}/bin/fleet
	dobin ${S}/bin/fleetctl

	systemd_dounit "${FILESDIR}"/${PN}.service
}