## -*- mode: makefile-gmake -*-

EMACS		= emacs
TANGLE_EL	= ./tangle.el
LINTER		= textlint
LINTER_CONFIG	= ./textlintrc

tangle: $(TANGLE_EL)
	$(EMACS) --quick --script $<

lint: $(wildcard public/*/*.txt)
	$(LINTER) --config $(LINTER_CONFIG) $@
