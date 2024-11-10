## ipa-server-install
hostnamect set-hostname ipa.redh.hat
echo "x.x.x.x ipa.red.hat ipa" >> /etc/hosts
#

ipa-server-install --mkhomedir --no-ntp --setup-dns --domain=red.hat --hostname=ipa.red.hat \
--realm=RED.HAT --ds-password=dspassword --admin-password=password --no-forwarders --auto-reverse \
--netbios-name=RED --unattended

## tcp
#80
firewall-cmd --permanent --add-service http 
#443
firewall-cmd --permanent --add-service https
#389
firewall-cmd --permenant --add-service ldap
#636 --add-port 636/tcp
firewall-cmd --permenant --add-service ldaps
#88,464 --add-port 88/tcp --add-port 464/tcp
firewall-cmd --permanent --add-service kerberos
#53 --add-port 53/tcp
firewall-cmd --permanent --add-service bind

## udp
# 88, 464 kerberos
firewall-cmd --permanent --add-port 88/udp 
firewall-cmd --permanent --add-port 464/udp
# 53
firewall-cmd --permanent --add-port 53/udp 

firewall-cmd --reload
