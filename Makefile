all:
	@echo "make install/make uninstall"

install:
	install -v -D -m 0755 apt-key-migrate /usr/local/sbin/
	install -v -D -m 0644 apt-key-migrate.service /etc/systemd/system/
	systemctl enable apt-key-migrate.service

uninstall:
	-systemctl disable apt-key-migrate.service
	-rm -f /usr/local/sbin/apt-key-migrate
	-rm -f /etc/systemd/system/apt-key-migrate.service