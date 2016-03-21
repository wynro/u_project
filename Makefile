pkg:
	make pkg-noclean
	make clean

clean:
	sudo rm -r "sa-u"

pkg-noclean:
	# Directory structure
	mkdir sa-u
	mkdir sa-u/DEBIAN
	mkdir sa-u/usr
	mkdir sa-u/usr/bin
	mkdir sa-u/usr/share
	mkdir sa-u/usr/share/doc
	mkdir sa-u/usr/share/doc/sa-u
	mkdir sa-u/usr/share/man
	mkdir sa-u/usr/share/man/man1
	mkdir sa-u/etc
	mkdir sa-u/etc/bash_completion.d
	# File structure
	cp u sa-u/usr/bin
	cp u.1 sa-u/usr/share/man/man1
	gzip -9 sa-u/usr/share/man/man1/u.1
	cp changelog.Debian sa-u/usr/share/doc/sa-u
	gzip -9 sa-u/usr/share/doc/sa-u/changelog.Debian
	cp sa-u_completion sa-u/etc/bash_completion.d/sa-u
	cp copyright sa-u/usr/share/doc/sa-u
	cp control sa-u/DEBIAN
	cp conffiles sa-u/DEBIAN
	# Permissions
	sudo chown -R root:root sa-u/*
	sudo chmod 755 sa-u/usr sa-u/usr/bin sa-u/usr/bin/u sa-u/usr/share sa-u/usr/share/doc sa-u/usr/share/doc/sa-u sa-u/usr/share/man/ sa-u/usr/share/man/man1 sa-u/etc sa-u/etc/bash_completion.d
	sudo chmod 644 sa-u/usr/share/doc/sa-u/* sa-u/usr/share/man/man1/* sa-u/etc/bash_completion.d/* sa-u/DEBIAN/*
	# Package build
	dpkg --build sa-u

cleanAll:
	sudo rm -r "sa-u"
	sudo rm "sa-u.deb"

upload:
	scp u central:.u/
	scp u.1 central:.u/
