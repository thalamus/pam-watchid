PREFIX ?= /usr/local
LIBRARY_NAME = pam_watchid.so
DESTINATION = $(addprefix $(PREFIX), /lib/pam)
TARGET = x86_64-apple-macosx10.15

.PHONY: all
all: $(LIBRARY_NAME)

$(LIBRARY_NAME): watchid-pam-extension.swift
	swiftc watchid-pam-extension.swift -o $(LIBRARY_NAME) -target $(TARGET) -emit-library

.PHONY: install
install: all
	mkdir -p $(DESTINATION)
	cp $(LIBRARY_NAME) $(DESTINATION)/$(LIBRARY_NAME)
