PPT_DIR = ppts
EXP_DIR = expanded
BLD_DIR = build
DIRS := $(BLD_DIR) $(PPT_DIR) $(EXP_DIR)

PPTXS := $(wildcard $(PPT_DIR)/*.pptx)
ifeq "x$(PPTXS)" "x"
PPTXS += $(PPT_DIR)/dummy.pptx
endif

EXPANDED := $(wildcard $(EXP_DIR)/*-expanded)
ifeq "x$(EXPANDED)" "x"
EXPANDED += $(EXP_DIR)/dummy-expanded
endif

TOEXPAND := $(PPTXS:$(PPT_DIR)/%.pptx=$(EXP_DIR)/%-expanded)
TOBUILD := $(EXPANDED:$(EXP_DIR)/%-expanded=$(BLD_DIR)/%.pptx)

# define targets allowed to make
TARGETS := prepare expand collapse clean destructive_clean

.PHONY: prepare expand collapse clean destructive_clean

_default: _sysinfo _hint

_hint:
	@echo "\e[32mmake expand\e[0m: expand ppts in \e[33m$(PPT_DIR)\e[0m into \e[33m$(EXP_DIR)\e[0m"
	@echo "\e[36mmake collapse\e[0m: build ppts from \e[33m$(EXP_DIR)\e[0m into \e[33m$(BLD_DIR)\e[0m"

_sysinfo:
	@echo "\e[34m****** SYSTEM INFOMATION ******\e[0m"
	@sed --version 2>&1 | sed -n '1p'
	@echo
	@zip -v 2>&1 | sed -n '2p'
	@echo
	@unzip -v 2>&1 | sed -n '1p'
	@echo "\e[34m****** SYSTEM INFOMATION ******\e[0m"
	@echo


# expand ppts
expand: prepare $(TOEXPAND)

$(TOEXPAND): _FORCE
	@echo
	unzip -o -d $@ $(@:$(EXP_DIR)/%-expanded=$(PPT_DIR)/%.pptx)


# build ppts
collapse: prepare $(TOBUILD)

$(TOBUILD): _FORCE
	@echo
	cd $(@:$(BLD_DIR)/%.pptx=$(EXP_DIR)/%-expanded); zip $(PWD)/$@ -r .

_FORCE:

prepare:
	mkdir -p $(DIRS)
	mkdir -p $(EXP_DIR)/dummy-expanded
	touch $(EXP_DIR)/dummy-expanded/dummy
	touch dummy; zip $(PPT_DIR)/dummy.pptx dummy; rm dummy


clean:
	rm -rf $(BLD_DIR)

destructive_clean:
	rm -rf $(DIRS)


ifdef MAKECMDGOALS

# force legal targets
ifeq "x$(findstring $(MAKECMDGOALS), $(TARGETS))" "x"
$(error illegal target `$(MAKECMDGOALS)')
endif

endif
