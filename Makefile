# Ancient Makefile implicit rule disabler
(%): %
%:: %,v
%:: RCS/%,v
%:: s.%
%:: SCCS/s.%
%.out: %
%.c: %.w %.ch
%.tex: %.w %.ch
%.mk:

# Variables
FRONTEND_DIR    := frontend
BACKEND_DIR     := backend

# Let there be no default target
.PHONY: default
default:
	@echo "There is no default make target.  Specify one of:"
	@echo "etags                   - constructs an emacs tags table"
	@echo ""
	@echo "See ${BUILD_DIR}/README.md for more details and info"

# emacs tags
ETAG_SRCS := $(shell find * -type f -name '*.py' -o -name '*.md' | grep -v defunct)
.PHONY: etags
etags: ${ETAG_SRCS}
	etags ${ETAG_SRCS}
