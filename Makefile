THREE := x x x
FIVE  := x x x x x

DOUBLE = $(1) $(1)
MAX = $(subst xx,x,$(join $(1),$(2)))
MIN = $(subst xx,x,$(filter xx,$(join $(1),$(2))))

ADD = $(1) $(2)
SUB = $(filter-out xx,$(join $(1),$(2)))

# no more than four function calls
GT = $(firstword $(wordlist $(words $(2) x), $(words $(1)), $(1)))

.PHONY: all
all:
	@echo "THREE: $(words $(THREE))"
	@echo "FIVE: $(words $(FIVE))"
	@echo "THREE + FIVE: $(words $(call ADD, $(THREE), $(FIVE)))"
	@echo "DOUBLE 3: $(words $(call DOUBLE, $(THREE)))"
	@echo "MAX 3 5: $(words $(call MAX,$(THREE),$(FIVE)))"
	@echo "MIN 3 5: $(words $(call MIN,$(THREE),$(FIVE)))"
	@echo "SUB: $(words $(call SUB, $(FIVE), $(THREE)))"
	@echo "GT: $(call GT, $(FIVE), $(THREE))"
	@echo "GT: $(call GT, $(THREE), $(FIVE))"
	@echo "GT: $(call GT, $(THREE), $(THREE))"
	@echo "SB: $(wordlist $(words $(THREE)), $(words $(FIVE)), $(FIVE))"
	@echo "SB: $(wordlist 5, 3, x x x)"
