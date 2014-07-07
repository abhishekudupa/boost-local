default: all

all: boost_install/install.ph

boost_install/install.ph:
	cd boost_1_55_0; ./bootstrap.sh --prefix=../boost_install; ./b2 link=static install; \
	cd ..; touch $@

.PHONY: clean

clean:
	./b2 --clean; rm -rf boost_install/include; rm -rf boost_install/lib

