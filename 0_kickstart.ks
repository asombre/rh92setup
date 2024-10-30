#version=RHEL9
# Use text mode install
text
repo --name="AppStream" --baseurl=file:///run/install/sources/mount-0000-cdrom/AppStream

%addon com_redhat_kdump --disable

%end

# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=enp1s0 --activate
network  --hostname=newhost.xxx.xxx

# Use CDROM installation media
cdrom

%packages
@^minimal-environment
@standard

%end
# Run the Setup Agent on first boot
firstboot --disable
# Do not configure the X Window System
skipx

# Generated using Blivet version 3.6.0
ignoredisk --only-use=vda
# System bootloader configuration
bootloader --location=mbr --boot-drive=vda
autopart --type=plain
# Partition clearing information
clearpart --all --initlabel --drives=vda

# System timezone
timezone America/Denver --utc

# Root password
rootpw --allow-ssh --iscrypted <encrypted_password>
user --groups=wheel --name=<username> --password=<encrypted_password> --iscrypted --gecos="First Last"

reboot
