default: all

all: boost_install/install.ph

boost_install/install.ph:
	cd boost_latest; ./bootstrap.sh --prefix=../boost_install; ./b2 -j 8 link=static install; \
	NO_BZIP2=1 ./b2 --clean; cd ..; touch $@

.PHONY: clean

clean:
	rm -rf boost_install/include; rm -rf boost_install/lib; rm -rf boost_install/install.ph

