For FreeBSD

# Local/FS installation

1) pkg install puppet7 puppetserver7 rubygem-hiera rubygem-hiera-eyaml rubygem-hiera-file
2) puppetserver gem install hiera-eyaml
   puppetserver gem install eyaml

   and/or

   gem install hiera
   gem install hiera-eyaml

3) echo '127.0.0.1 puppet' >> /etc/hosts
4) mv /usr/local/etc/puppet /usr/local/etc/puppet-o
5) git clone https://github.com/olevole/puppet-empty.git /usr/local/etc/puppet
6) rm -rf /usr/local/etc/puppet/.git
7) drop 'code/modules' dir into /usr/local/etc/puppet/ e.g: https://forge.puppet.com/zleslie/pkgng
``` 
   puppet module install zleslie-pkgng
```
8) ln -sf /usr/local/etc/puppet/modules /usr/local/etc/puppet/code/environments/modules
9) service puppetserver enable
10) service puppetserver start

# GitLab integration
