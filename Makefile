.all:

.PHONY: all doc doc-man doc-latex docclean print-versions welcome

all: welcome
	@echo ""
	@exit 1

doc:
	"$(MAKE)" -BC doc/doxygen

doc-man:
	"$(MAKE)" -BC doc/doxygen man

doc-latex:
	"$(MAKE)" -BC doc/doxygen latex

docclean:
	"$(MAKE)" -BC doc/doxygen clean

clean:
	@echo "Cleaning all build products for the current board"
	@for dir in $(APPLICATION_DIRS); do "$(MAKE)" -C$$dir clean; done

pkg-clean:
	@echo "Cleaning all package sources"
	rm -rf build/pkg

distclean: docclean pkg-clean
	@echo "Cleaning all build products"
	@for dir in $(APPLICATION_DIRS); do "$(MAKE)" -C$$dir distclean; done

print-versions:
	@./dist/tools/ci/print_toolchain_versions.sh

include makefiles/boards.inc.mk
include makefiles/app_dirs.inc.mk

include makefiles/tools/riotgen.inc.mk
-include makefiles/tests.inc.mk

include makefiles/color.inc.mk

welcome:
	@echo "Welcome to RIOT - The friendly OS for IoT!"
	@echo ""
	@echo "You executed 'make' from the base directory."
	@echo "Usually, you should run 'make' in your application's directory instead."
	@echo ""
	@echo "Please see our Quick Start Guide at:"
	@echo "    https://doc.riot-os.org/getting-started.html"
	@echo "You can ask questions or discuss with other users on our forum:"
	@echo "    https://forum.riot-os.org"
	@echo ""
	@echo "Available targets for the RIOT base directory include:"
	@echo " generate-{board,driver,example,module,pkg,test}"
	@echo " info-{applications,boards,emulated-boards} info-applications-supported-boards"
	@echo " print-versions"
	@echo " clean distclean pkg-clean"
	@echo " doc doc-{man,latex}"
	@echo ""
	@echo "==> tl;dr Try running:"
	@echo "    cd examples/default"
	@echo "    make BOARD=<INSERT_BOARD_NAME>"
