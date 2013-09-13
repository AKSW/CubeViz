default:
	@echo "CubeViz Deployment"
	@echo ""
	@echo "  use make install to setup repository"

install:
	git submodule init && git submodule update --remote
	cd application
	make libraries
