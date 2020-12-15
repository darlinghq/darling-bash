# System-wide .profile for sh(1)

if [ ! -d ~/Library ]; then
	cp -r "/System/Library/User Template/Library" ~/
fi

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

if [ -d /etc/profile.d ]; then
	for sh in /etc/profile.d/*.sh ; do
		[ -r "$sh" ] && . "$sh"
	done
	unset sh
fi
