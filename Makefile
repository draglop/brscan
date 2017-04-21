SHELL = /bin/sh


srcdir = .
top_srcdir = .
top_builddir = .

PACKAGE = sane-backends
VERSION = 1.0.7
distdir = $(PACKAGE)-$(VERSION)

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include

MKDIR = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644



SUBDIRS	= backend_brscan

DISTFILES = AUTHORS COPYING ChangeLog ChangeLog-1.0.0 ChangeLog-1.0.1 \
  ChangeLog-1.0.2 ChangeLog-1.0.3 ChangeLog-1.0.4 ChangeLog-1.0.5 LEVEL2 \
  LICENSE Makefile.in NEWS \
  PROBLEMS PROJECTS README README.aix README.hp-ux README.linux README.netbsd \
  README.openbsd README.os2 README.solaris README.unixware2 README.unixware7 \
  TODO acinclude.m4 aclocal.m4 config.guess config.sub configure \
  configure.in configure.os2 install-sh ltconfig ltmain.sh mkinstalldirs \
  sane-backends.lsm

.PHONY: all all-recursive clean clean-recursive depend \
  depend-recursive dist install install-recursive libcheck lsm \
  sane-backends sort-cvsignore uninstall uninstall-recursive

all:    brscan

brscan:
	(cd lib && make)
	(cd sanei && make)
	(cd backend_brscan && make brscan)
	(cd netconfig && make brscan)
	(cd mk_package  && make brscan)

clean: clean-recursive

distclean: clean distclean-recursive
	rm -f *~ *.log *.bak libtool
	rm -f Makefile config.cache config.status
	rm -rf $(distdir)

depend: depend-recursive

all-recursive install-recursive clean-recursive distclean-recursive \
depend-recursive uninstall-recursive:
	@for subdir in $(SUBDIRS); do		\
	  target=`echo $@ | sed s/-recursive//`; \
	  echo making $$target in $$subdir;	\
	  (cd $$subdir && $(MAKE) $$target)	\
	   || case "$(MFLAGS)" in *k*) fail=yes;; *) exit 1;; esac; \
	done && test -z "$$fail"

dist: $(DISTFILES)
	rm -fr $(distdir)
	$(MKDIR) $(distdir)
	for file in $(DISTFILES); do \
	  ln $$file $(distdir) 2>/dev/null || cp -p $$file $(distdir); \
	done
#	for subdir in $(SUBDIRS) japi testsuite ; do \
#	  mkdir $(distdir)/$$subdir || exit 1; \
#	  chmod 777 $(distdir)/$$subdir; \
#	  (cd $$subdir && $(MAKE) $@) || exit 1; \
#	done
	tar chzf $(distdir).tar.gz $(distdir)
	rm -fr $(distdir)
