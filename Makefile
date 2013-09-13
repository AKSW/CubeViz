default:
	@echo "CubeViz Deployment"
	@echo ""
	@echo "  use make install to setup repository"

install:
	git submodule init && git submodule update --remote
	cd application && make install
	cd application/libraries/Erfurt && git fetch && git checkout feature/skyrocketingSpeedup
	@echo " "
	@echo "##################################################"
	@echo "... do not forget"
	@echo "        > to setup application/config.ini"
	@echo "        > to create a symbolic link to application folder"
	@echo "##################################################"
