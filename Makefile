###############################################################################
#
# Copyright (c) 2018 NVIDIA CORPORATION.  All Rights Reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#
###############################################################################

CC:= g++

PKGS:= glib-2.0 gobject-2.0 json-glib-1.0 uuid

NVDS_VERSION:=5.0

LIB_INSTALL_DIR?=/opt/nvidia/deepstream/deepstream-$(NVDS_VERSION)/lib/

CFLAGS:= -Wall -std=c++11 -shared -fPIC

CFLAGS+= -I../../includes

CFLAGS+= `pkg-config --cflags $(PKGS)`
LIBS:= `pkg-config --libs $(PKGS)`

SRCFILES:= nvmsgconv.cpp
TARGET_LIB:= libnvds_msgconv.so

all: $(TARGET_LIB)

$(TARGET_LIB) : $(SRCFILES)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

install: $(TARGET_LIB)
	cp -rv $(TARGET_LIB) $(LIB_INSTALL_DIR)

clean:
	rm -rf $(TARGET_LIB)
