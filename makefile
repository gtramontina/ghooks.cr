.DELETE_ON_ERROR:
.PHONY: install
.DEFAULT_GOAL := install

root := $(shell git rev-parse --show-cdup)
git := $(root).git

# ------------------------------------------------------------------------------

ifeq ($(wildcard $(git)),)
install:; @$(error Git hooks not installed)

# ------------------------------------------------------------------------------

else
ifeq ($(root),)
root := ./
endif

hooks := $(shell cd $(root); git rev-parse --git-path hooks)
backup := $(addsuffix .bkp,$(hooks))

install:
	@cd $(root); \
	mv $(hooks) $(backup) && \
	mkdir -p .githooks && \
	ln -s -F ../.githooks $(hooks)

endif # ------------------------------------------------------------------------
