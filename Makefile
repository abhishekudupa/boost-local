default: all

BUILD_ROOT=$(realpath .)

all: boost_install/install.ph

boost_install/install.ph:
	cd bzip2-1.0.6; $(MAKE) -f Makefile-libbz2_a; cd ..; cd boost_latest; \
	./bootstrap.sh --prefix=../boost_install; \
	BZIP2_SOURCE=$(BUILD_ROOT)/bzip2-1.0.6 ./b2 -j 8 install; \
	./b2 --clean; cd ..; cd bzip2-1.0.6; make -f Makefile-libbz2_a clean; \
	cd ..; touch $@

.PHONY: clean

clean:
	rm -rf boost_install/include; rm -rf boost_install/lib; \
	rm -rf boost_install/install.ph; cd bzip2-1.0.6; \
	$(MAKE) -f Makefile-libbz2_a clean
