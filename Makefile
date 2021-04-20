PPT_DIR = ppts
EXP_DIR = expanded
BLD_DIR = build
DIRS := $(BLD_DIR) $(PPT_DIR) $(EXP_DIR)

# define targets allowed to make
TARGETS = prepare expand collapse clean destructive_clean

PPTXS := $(wildcard $(PPT_DIR)/*.pptx)
## safety enforcement: force at least one PPTX
ifeq "x$(PPTXS)" "x"
PPTXS += $(PPT_DIR)/dummy.pptx
endif

EXPANDED := $(PPTXS:$(PPT_DIR)/%.pptx=$(EXP_DIR)/%-expanded)
BUILDS := $(PPTXS:$(PPT_DIR)/%.pptx=$(BLD_DIR)/%.pptx)

_default: _sysinfo _hint

_hint:
	@echo "\e[32mmake expand\e[0m: expand ppts in \e[33m$(PPT_DIR)\e[0m into \e[33m$(EXP_DIR)\e[0m"
	@echo "\e[34mmake collapse\e[0m: build ppts from \e[33m$(EXP_DIR)\e[0m into \e[33m$(BLD_DIR)\e[0m"

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
expand: prepare $(EXPANDED)

$(EXPANDED): $(EXP_DIR)/%-expanded: $(PPT_DIR)/%.pptx
	@echo
	unzip -o -d $@ $<

# build ppts
collapse: prepare $(BUILDS)

$(BUILDS): $(BLD_DIR)/%.pptx: $(EXP_DIR)/%-expanded
	@echo
	cd $<; zip $(PWD)/$@ -r .


prepare: prepare_dirs $(PPT_DIR)/dummy.pptx

prepare_dirs:
	mkdir -p $(DIRS)

$(PPT_DIR)/dummy.pptx:
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
