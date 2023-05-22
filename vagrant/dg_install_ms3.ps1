# Metapsloitable 3 configuration script
Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Installing: Pre-reqs                           #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./chocolatey.ps1
popd
pushd scripts/chocolatey_installs
./boxstarter.bat
./7zip.bat
popd
pushd scripts/configs
./apply_password_settings.bat
./create_users.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: RDP                               #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/configs
./enable-rdp.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: IIS and FTP                       #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_iis.bat
./setup_ftp_site.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Apache Struts                     #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/chocolatey_installs
./java.bat
./tomcat.bat
popd

pushd scripts/installs
./setup_apache_struts.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Glassfish                         #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_glassfish.bat
./start_glassfish_service.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Jenkins                           #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_jenkins.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Wordpress, phpmyadmin             #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/chocolatey_installs
./vcredist2008.bat
popd

pushd scripts/installs
./install_wamp.bat
./start_wamp.bat
./install_wordpress.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: JMX                               #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./install_openjdk6.bat
./setup_jmx.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Rails server                      #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/chocolatey_installs
./ruby.bat
popd

pushd scripts/installs
./install_devkit.bat
./install_rails_server.bat
./setup_rails_server.bat
./install_rails_service.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: WebDAV                            #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_webdav.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: MySQL                             #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_mysql.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: ManageEngine desktop Central      #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./install_manageengine.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Axis2                             #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_axis2.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Common backdoors                  #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./install_backdoors.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: SNMP                              #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./setup_snmp.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Firewall                          #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host
# Easy
pushd scripts/configs
./disable_firewall.bat
popd

# Difficult
# pushd scripts/configs
# ./configure_firewall.bat
# popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Elasticsearch                     #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./install_elasticsearch.bat
popd

Write-Host
Write-Host "##################################################"
Write-Host "#                                                #"
Write-Host "# Configuring: Flags                             #"
Write-Host "#                                                #"
Write-Host "##################################################"
Write-Host

pushd scripts/installs
./install_flags.bat
popd

#Write-Host
#Write-Host "##################################################"
#Write-Host "#                                                #"
#Write-Host "# Configuring:                                   #"
#Write-Host "#                                                #"
#Write-Host "##################################################"
#Write-Host

#pushd scripts/chocolatey_installs
#./
#popd

#pushd scripts/installs
#./
#popd

#pushd scripts/configs
#./
#popd
