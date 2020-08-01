For FreeBSD

1) pkg install puppet6 puppetserver6 rubygem-hiera rubygem-hiera-eyaml rubygem-hiera-file
2) puppetserver gem install hiera-eyaml
   puppetserver gem install eyaml

   and/or

   gem install hiera
   gem install hiera-eyaml

3) echo '127.0.0.1 puppet' >> /etc/hosts
4) drop 'code/modules' dir into /usr/local/etc/puppet/
5) start with https://forge.puppet.com/zleslie/pkgng
