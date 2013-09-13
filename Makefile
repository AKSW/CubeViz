default:
	@echo "CubeViz Deployment"
	@echo ""
	@echo "  use make install to setup repository"

install:
	@echo ""
	@echo "###################################################"
	@echo "Install OntoWiki (branch feature/skyrocketingSpeed)"	
	@echo "###################################################"
	git submodule init && git submodule update --remote
	
	@echo ""
	@echo "##############"
	@echo "Setup OntoWiki"	
	@echo "##############"
	cd application && make install
	
	@echo ""
	@echo "###################################################"
	@echo "Install Erfurt (branch feature/skyrocketingSpeedup)"	
	@echo "###################################################"
	cd application && make install
	cd application/libraries/Erfurt && git fetch && git checkout feature/skyrocketingSpeedup
	
	@echo ""
	@echo "#########################################"
	@echo "Install and setup CubeViz (branch master)"	
	@echo "#########################################"
	cd application && make install
	cd application/extensions && git clone git@github.com:AKSW/cubeviz.ontowiki.git cubeviz && git checkout master
	cd application/extensions/cubeviz/ && make install
	
	@echo " "
	@echo "##################################################"
	@echo "... do not forget"
	@echo "        > to setup application/config.ini"
	@echo "        > to create a symbolic link to application folder"
	@echo "##################################################"
