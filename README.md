# Metasploitable 3 configuration for Windows 2008 R2
## Pre-amble
This small package was written due to consistent failures in the packer/vagrant/chef build from Rapid 7.

In essence, the default configuration of Win2K8R2 does not have the right versions of .Net or WMF (Powershell).  The correct version of Powershell is important, because v 2.0 will only ever use it's own version of .Net, so calls to [net.servicepointmanager]::securityprotocol tls12 will always fail. To confirm, run [enum]::GetNames([Net.SecurityProtocolType]) from the Powershell prompt and you should see something like the following output (but including Tls12):

PS C:\Users\Administrator> [enum]::GetNames([Net.SecurityProtocolType])
Ssl3
Tls
Tls11
Tls12
PS C:\Users\Administrator>

Additionally, there is no obvious single script with the installation order for the scripts; some rely on others to be run first, others are entirely but confusingly independent.

The following process script dg\_install\_ms3.ps1 is the end result of some experimentation and should automate the process of configuring an out-of-the-box Win2K8R2 VM for Metasploitable 3.

Finally, read the section in the script which configures the firewall to automatically enable/disable the firewall.

First, copy this folder and the executable installers to the VM. Copy the sub-folder "vagrant" to the VM as "C:\vagrant"

In the VM:

1. There are several downloads prior to install, so make sure your VM is on a NAT or Bridged network.
2. From this folder, install .Net 4.6 (either the online installer DOT\_NET\_4.6\_ONLINE\_NDP46-KB3045560-Web.exe or the offline installer DOT\_NET\_4.6\_OFFLINE\_NDP46-KB3045557-x86-x64-AllOS-ENU.exe).
3. {Restart}
3. Install WMF 3.0 (WMF\_3.0_Windows6.1-KB2506143-x64.msu).
4. {Restart}
4. [Optional] To obviate the problems I had with vcredist run the installer (vcredist\_x64.exe) or take your chances with the script.
5. [Optional] create the administrator user vagrant : vagrant on the VM (you can of course use your own admin account).
5. cd C:\vagrant
6. Set-ExecutionPolicy -ExecutionPolicy Bypass
7. Enter 'y' to confirm
6. ./dg\_install\_ms3.ps1
7. Snapshot the VM

Good luck!