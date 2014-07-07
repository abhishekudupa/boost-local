default: all

all: boost_install/install.ph

boost_install/install.ph:
	cd boost_1_55_0; ./bootstrap.sh --prefix=../boost_install; ./b2 -j 8 link=static install; \
	./b2 --clean; cd ..; touch $@

.PHONY: clean

clean:
	rm -rf boost_install/include; rm -rf boost_install/lib; rm -rf boost_install/install.ph

