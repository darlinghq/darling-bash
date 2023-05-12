# System-wide .profile for sh(1)

# Darling: Copy template if ~/Library does not exist
if [ ! -d ~/Library ]; then
	cp -r "/System/Library/User Template/Library" ~/
fi

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# Darling: Execute shell scripts in /etc/profile.d (?)
if [ -d /etc/profile.d ]; then
	for sh in /etc/profile.d/*.sh ; do
		[ -r "$sh" ] && . "$sh"
	done
	unset sh
fi