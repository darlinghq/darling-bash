project(bash)

cmake_minimum_required(VERSION 2.4.0)

if(COMMAND cmake_policy)
	cmake_policy(SET CMP0003 NEW)
	cmake_policy(SET CMP0005 NEW)
endif(COMMAND cmake_policy)

add_definitions(-D__APPLE__ -D__MACH__)
add_definitions(-DTARGET_OS_MAC=1)
add_definitions(-D__APPLE__ -D__DYNAMIC__ -U__linux__)
add_definitions(-D__ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__=1080)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc -D__DARWIN_UNIX03 -fPIC -w -ggdb -O0")

add_definitions(-DHAVE_CONFIG_H)
add_definitions(-DM_UNIX -DIN_LIBINTL -DMACOSX -DSHELL -DSSH_SOURCE_BASHRC)
add_definitions(-DCONF_VENDOR="apple" -DCONF_MACHTYPE="Mac" -DCONF_OSTYPE="darwin14")
add_definitions(-DPACKAGE="BASH" -DLOCALEDIR="${CMAKE_INSTALL_PREFIX}/share/darling/bash")
add_definitions(-DLIBDIR="${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/darling")
add_definitions(-DLOCALE_ALIAS_PATH="${CMAKE_INSTALL_PREFIX}/share/darling/locale")
add_definitions(-DHAVE_DECL_SBRK=1)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/bash-3.2)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/bash-3.2/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/bash-3.2/lib)
include_directories(${CMAKE_SOURCE_DIR}/src/libc/gen)
include_directories(${CMAKE_SOURCE_DIR}/src/ncurses/include)
BISON_TARGET(MyParser bash-3.2/parse.y ${CMAKE_CURRENT_BINARY_DIR}/y.tab.c)

set(bash_SRCS
	${CMAKE_CURRENT_BINARY_DIR}/y.tab.c
	syntax.c
	bash-3.2/alias.c
	bash-3.2/array.c
	bash-3.2/arrayfunc.c
	bash-3.2/bashhist.c
	bash-3.2/bashline.c
	bash-3.2/bracecomp.c
	bash-3.2/braces.c
	bash-3.2/copy_cmd.c
	bash-3.2/dispose_cmd.c
	bash-3.2/error.c
	bash-3.2/eval.c
	bash-3.2/execute_cmd.c
	bash-3.2/expr.c
	bash-3.2/findcmd.c
	bash-3.2/flags.c
	bash-3.2/general.c
	bash-3.2/hashcmd.c
	bash-3.2/hashlib.c
	bash-3.2/input.c
	bash-3.2/jobs.c
	bash-3.2/list.c
	bash-3.2/locale.c
	bash-3.2/mailcheck.c
	bash-3.2/make_cmd.c
	#bash-3.2/mksyntax.c
	#bash-3.2/nojobs.c
	bash-3.2/pathexp.c
	bash-3.2/pcomplete.c
	bash-3.2/pcomplib.c
	bash-3.2/print_cmd.c
	bash-3.2/redir.c
	bash-3.2/shell.c
	bash-3.2/sig.c
	bash-3.2/siglist.c
	bash-3.2/stringlib.c
	bash-3.2/subst.c
	bash-3.2/test.c
	bash-3.2/trap.c
	bash-3.2/unwind_prot.c
	bash-3.2/variables.c
	bash-3.2/version.c
	#bash-3.2/xmalloc.c

	bash-3.2/builtins/alias.c
	bash-3.2/builtins/bashgetopt.c
	bash-3.2/builtins/bind.c
	bash-3.2/builtins/break.c
	bash-3.2/builtins/builtin.c
	bash-3.2/builtins/builtins.c
	bash-3.2/builtins/caller.c
	bash-3.2/builtins/cd.c
	bash-3.2/builtins/colon.c
	bash-3.2/builtins/command.c
	bash-3.2/builtins/common.c
	bash-3.2/builtins/complete.c
	bash-3.2/builtins/declare.c
	bash-3.2/builtins/echo.c
	bash-3.2/builtins/enable.c
	bash-3.2/builtins/eval.c
	bash-3.2/builtins/evalfile.c
	bash-3.2/builtins/evalstring.c
	bash-3.2/builtins/exec.c
	bash-3.2/builtins/exit.c
	bash-3.2/builtins/fc.c
	bash-3.2/builtins/fg_bg.c
	bash-3.2/builtins/getopt.c
	bash-3.2/builtins/getopts.c
	bash-3.2/builtins/hash.c
	bash-3.2/builtins/help.c
	bash-3.2/builtins/history.c
	bash-3.2/builtins/jobs.c
	bash-3.2/builtins/kill.c
	bash-3.2/builtins/let.c
	#bash-3.2/builtins/mkbuiltins.c
	bash-3.2/builtins/printf.c
	#bash-3.2/builtins/psize.c
	bash-3.2/builtins/pushd.c
	bash-3.2/builtins/read.c
	bash-3.2/builtins/return.c
	bash-3.2/builtins/setattr.c
	bash-3.2/builtins/set.c
	bash-3.2/builtins/shift.c
	bash-3.2/builtins/shopt.c
	bash-3.2/builtins/source.c
	bash-3.2/builtins/suspend.c
	bash-3.2/builtins/test.c
	bash-3.2/builtins/times.c
	bash-3.2/builtins/trap.c
	bash-3.2/builtins/type.c
	bash-3.2/builtins/ulimit.c
	bash-3.2/builtins/umask.c
	bash-3.2/builtins/wait.c

	bash-3.2/lib/glob/glob.c
	bash-3.2/lib/glob/smatch.c
	bash-3.2/lib/glob/strmatch.c
	bash-3.2/lib/glob/xmbsrtowcs.c

	bash-3.2/lib/intl/bindtextdom.c
	bash-3.2/lib/intl/dcgettext.c
	bash-3.2/lib/intl/dcigettext.c
	bash-3.2/lib/intl/dcngettext.c
	bash-3.2/lib/intl/dgettext.c
	bash-3.2/lib/intl/dngettext.c
	bash-3.2/lib/intl/explodename.c
	bash-3.2/lib/intl/finddomain.c
	bash-3.2/lib/intl/gettext.c
	bash-3.2/lib/intl/intl-compat.c
	bash-3.2/lib/intl/l10nflist.c
	bash-3.2/lib/intl/loadmsgcat.c
	bash-3.2/lib/intl/localcharset.c
	bash-3.2/lib/intl/localealias.c
	bash-3.2/lib/intl/localename.c
	bash-3.2/lib/intl/log.c
	bash-3.2/lib/intl/ngettext.c
	#bash-3.2/lib/intl/os2compat.c
	bash-3.2/lib/intl/osdep.c
	bash-3.2/lib/intl/plural.c
	bash-3.2/lib/intl/plural-exp.c
	bash-3.2/lib/intl/relocatable.c
	bash-3.2/lib/intl/textdomain.c

	#bash-3.2/lib/malloc/alloca.c
	#bash-3.2/lib/malloc/malloc.c
	#bash-3.2/lib/malloc/stats.c
	#bash-3.2/lib/malloc/stub.c
	#bash-3.2/lib/malloc/table.c
	#bash-3.2/lib/malloc/trace.c
	#bash-3.2/lib/malloc/watch.c
	bash-3.2/lib/malloc/xmalloc.c

	bash-3.2/lib/readline/bind.c
	bash-3.2/lib/readline/callback.c
	bash-3.2/lib/readline/compat.c
	bash-3.2/lib/readline/complete.c
	bash-3.2/lib/readline/display.c
	#bash-3.2/lib/readline/emacs_keymap.c
	bash-3.2/lib/readline/funmap.c
	bash-3.2/lib/readline/histexpand.c
	bash-3.2/lib/readline/histfile.c
	bash-3.2/lib/readline/history.c
	bash-3.2/lib/readline/histsearch.c
	bash-3.2/lib/readline/input.c
	bash-3.2/lib/readline/isearch.c
	bash-3.2/lib/readline/keymaps.c
	bash-3.2/lib/readline/kill.c
	bash-3.2/lib/readline/macro.c
	bash-3.2/lib/readline/mbutil.c
	bash-3.2/lib/readline/misc.c
	bash-3.2/lib/readline/nls.c
	bash-3.2/lib/readline/parens.c
	bash-3.2/lib/readline/readline.c
	bash-3.2/lib/readline/rltty.c
	bash-3.2/lib/readline/savestring.c
	bash-3.2/lib/readline/search.c
	#bash-3.2/lib/readline/shell.c
	bash-3.2/lib/readline/signals.c
	bash-3.2/lib/readline/terminal.c
	bash-3.2/lib/readline/text.c
	#bash-3.2/lib/readline/tilde.c
	bash-3.2/lib/readline/undo.c
	bash-3.2/lib/readline/util.c
	#bash-3.2/lib/readline/vi_keymap.c
	bash-3.2/lib/readline/vi_mode.c
	#bash-3.2/lib/readline/xmalloc.c

	bash-3.2/lib/sh/clktck.c
	bash-3.2/lib/sh/clock.c
	bash-3.2/lib/sh/eaccess.c
	bash-3.2/lib/sh/fmtullong.c
	bash-3.2/lib/sh/fmtulong.c
	bash-3.2/lib/sh/fmtumax.c
	bash-3.2/lib/sh/getcwd.c
	bash-3.2/lib/sh/getenv.c
	bash-3.2/lib/sh/inet_aton.c
	bash-3.2/lib/sh/itos.c
	bash-3.2/lib/sh/mailstat.c
	bash-3.2/lib/sh/makepath.c
	bash-3.2/lib/sh/memset.c
	bash-3.2/lib/sh/mktime.c
	bash-3.2/lib/sh/netconn.c
	bash-3.2/lib/sh/netopen.c
	bash-3.2/lib/sh/oslib.c
	bash-3.2/lib/sh/pathcanon.c
	bash-3.2/lib/sh/pathphys.c
	bash-3.2/lib/sh/rename.c
	bash-3.2/lib/sh/setlinebuf.c
	bash-3.2/lib/sh/shmatch.c
	bash-3.2/lib/sh/shquote.c
	bash-3.2/lib/sh/shtty.c
	bash-3.2/lib/sh/snprintf.c
	bash-3.2/lib/sh/spell.c
	bash-3.2/lib/sh/strcasecmp.c
	bash-3.2/lib/sh/strerror.c
	bash-3.2/lib/sh/strftime.c
	bash-3.2/lib/sh/strindex.c
	bash-3.2/lib/sh/stringlist.c
	bash-3.2/lib/sh/stringvec.c
	bash-3.2/lib/sh/strnlen.c
	bash-3.2/lib/sh/strpbrk.c
	bash-3.2/lib/sh/strstr.c
	bash-3.2/lib/sh/strtod.c
	bash-3.2/lib/sh/strtoimax.c
	bash-3.2/lib/sh/strtol.c
	bash-3.2/lib/sh/strtoll.c
	bash-3.2/lib/sh/strtoul.c
	bash-3.2/lib/sh/strtoull.c
	bash-3.2/lib/sh/strtoumax.c
	bash-3.2/lib/sh/strtrans.c
	bash-3.2/lib/sh/times.c
	bash-3.2/lib/sh/timeval.c
	bash-3.2/lib/sh/tmpfile.c
	bash-3.2/lib/sh/vprint.c
	bash-3.2/lib/sh/wcsdup.c
	bash-3.2/lib/sh/winsize.c
	bash-3.2/lib/sh/xstrchr.c
	bash-3.2/lib/sh/zcatfd.c
	bash-3.2/lib/sh/zread.c
	bash-3.2/lib/sh/zwrite.c

	bash-3.2/lib/termcap/termcap.c
	bash-3.2/lib/termcap/tparam.c
	bash-3.2/lib/termcap/version.c

	bash-3.2/lib/tilde/shell.c
	bash-3.2/lib/tilde/tilde.c

)

include(darling_exe)
include(InstallSymlink)

add_darling_executable(bash ${bash_SRCS})
target_link_libraries(bash ncurses)

install(TARGETS bash DESTINATION libexec/darling/bin)

set(BINARY_PACKAGING_MODE ON)
InstallSymlink(bash libexec/darling/bin/sh)

install(FILES bashrc profile DESTINATION libexec/darling/etc)

set(man1
	bash-3.2/doc/bash.1
	bash-3.2/doc/bashbug.1
	bash-3.2/doc/builtins.1
	bash-3.2/doc/rbash.1
)

install(FILES ${man1} DESTINATION libexec/darling/usr/share/man/man1)
