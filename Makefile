default:
	@echo "CubeViz Deployment"
	@echo ""
	@echo "  use 'make install' to setup repository"

install:
	@echo ""
	@echo ""
	@echo "######################################################"
	@echo "Install OntoWiki (branch feature/remoteSparqlEndpoint)"	
	@echo "######################################################"
	git clone git@github.com:AKSW/OntoWiki.git application
	cd application && git checkout feature/remoteSparqlEndpoint && git pull
	
	@echo ""
	@echo ""
	@echo "##############"
	@echo "Setup OntoWiki"	
	@echo "##############"
	cd application && make install
	
	@echo ""
	@echo ""
	@echo "###################################################"
	@echo "Install Erfurt (branch feature/remoteSparqlEndpoint)"	
	@echo "###################################################"
	cd application/libraries/Erfurt && git fetch && git checkout feature/remoteSparqlEndpoint
	
	@echo ""
	@echo ""
	@echo "#########################################"
	@echo "Install and setup CubeViz (branch master)"	
	@echo "#########################################"
	cd application/extensions && git clone git@github.com:AKSW/cubeviz.ontowiki.git cubeviz && cd cubeviz && git checkout master && make install
	
	@echo ""
	@echo ""
	@echo "################################################"
	@echo "Install and setup sparqlservices (branch master)"	
	@echo "################################################"
	cd application/extensions && git clone git@github.com:AKSW/sparqlservices.ontowiki.git sparqlservices
	
	@echo ""
	@echo ""
	@echo "##############################"
	@echo "Copy pre-configured extensions"
	@echo "##############################"
	cp -R assets/extensions/page application/extensions
	cp -R assets/extensions/staticlinks application/extensions
	
	@echo ""
	@echo ""
	@echo "#########################################"
	@echo "Copy pre-configured config.ini"	
	@echo "#########################################"
	cp assets/config.ini application/config.ini
	
	@echo " "
	@echo " "
	@echo "##################################################"
	@echo "... do not forget"
	@echo "    > to create a symbolic link to application folder"
	@echo "##################################################"
