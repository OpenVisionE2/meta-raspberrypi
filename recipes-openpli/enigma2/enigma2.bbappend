FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	${@bb.utils.contains('MACHINE_FEATURES', 'plipi', 'file://lirc.patch file://remote.conf', '', d)} \
"

do_install_append() {
	if echo "${MACHINE_FEATURES}" | grep -q plipi
	then
		install -d  ${D}/etc/enigma2
		install -m 0644 ${WORKDIR}/remote.conf \
		${D}/etc/enigma2
	fi
}
