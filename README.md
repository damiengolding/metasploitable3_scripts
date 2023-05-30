# Metasploitable 3 configuration for Windows 2008 R2
## Pre-amble
This small package was written due to problems I experienced with the packer/vagrant/chef build process.

In essence, the default configuration of Win2K8R2 does not have the right versions of .Net or WMF (Powershell), and a number of the scripts have now obsolete download URLs.  The correct version of Powershell is important, because v 2.0 will only ever use it's own version of .Net, so calls to [net.servicepointmanager]::securityprotocol tls12 will always fail. To confirm, after .Net 4.6 and WMF 3.0 installation, run [enum]::GetNames([Net.SecurityProtocolType]) from the Powershell prompt and you should see something like the following output (but including Tls12):

    PS C:\Users\Administrator>[enum]::GetNames([Net.SecurityProtocolType])
    Ssl3
    Tls
    Tls11
    Tls12
    PS C:\Users\Administrator>

The binary installers are included in this repo.

Additionally, there is no obvious single script with the installation order for the scripts; some rely on others to be run first, others are entirely but confusingly independent.

The included process script dg\_install\_ms3.ps1 is the end result of some experimentation and should automate the process of configuring an out-of-the-box Win2K8R2 VM for Metasploitable 3.

Finally, read the section in the script which configures the firewall to automatically enable/disable the firewall.

## In the VM

1. There are several downloads during installation, so make sure your VM is on a NAT or Bridged network and can access the internet.
2. Change the password policy in the VM to disable enforcement of password complexity:
	1. Click Start and select Run to open Run dialog box. Then type gpedit.msc and click OK to open Local Group Policy Editor.
	2. Expand Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.
	3. Double-click "Password must meet complexity requirements". Change the setting to "disabled" and then click Apply to save changes.
2. Create the administrator user vagrant : vagrant on the VM (this is required, for instance, for gem installation which looks for .gemrc in C:\Users\vagrant)
3. Login as vagrant : vagrant
4. Copy this folder to the VM. Copy the sub-folder "vagrant" to the VM as "C:\vagrant"
2. Install .Net 4.6 (https://dotnet.microsoft.com/en-us/download/dotnet-framework/net46).
3. {Restart}
3. Install WMF 3.0 (https://www.microsoft.com/en-gb/download/details.aspx?id=34595).
4. {Restart}
4. [Optional] To obviate the problems I had with the vcredist installation script, download and run the installer (https://aka.ms/vs/17/release/vc_redist.x64.exe) or take your chances with the script.
5. cd C:\vagrant
6. Set-ExecutionPolicy -ExecutionPolicy Bypass
7. Enter 'y' to confirm
6. ./dg\_install\_ms3.ps1
7. Shutdown and snapshot the VM

N.B. during installation you are likely to see at least 2 errors along the lines of "JAVA_HOME environment variable not set".

These can be safely ignored; the JAVA_HOME variable is in fact correctly set, and the error messages are emitted by startup scripts called before the environment variables are reloaded. The scripts work fine when the VM is restarted.

Good luck!