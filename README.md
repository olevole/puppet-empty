For FreeBSD

# Local/FS installation

1) `pkg install -y puppet8 puppetserver8 rubygem-hiera rubygem-hiera-eyaml rubygem-hiera-file git rubygem-psych`
2) `puppetserver gem install hiera-eyaml eyaml`

   and/or:
```
   gem install hiera
   gem install hiera-eyaml
```

*!notes!* if you get an error `LoadError: no such file to load -- /usr/local/lib/ruby/gems/3.0/gems/psych-5.0.2/lib/psych_jars, please checkout work-around from https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=261141#c7:
```
cat > /usr/local/lib/ruby/gems/3.0/gems/psych-5.0.2/lib/psych_jars.rb <<EOF
require 'psych.jar'

require 'jar-dependencies'
require_jar('org.yaml', 'snakeyaml', Psych::DEFAULT_SNAKEYAML_VERSION)
EOF
```
3) restore 'puppet' owner for /var/puppet/server/data/puppetserver dir: `chown puppet /var/puppet/server/data/puppetserver` after previous step, because you will get an error when starting puppetserver ( `File[/var/puppet/server/data/puppetserver/locales]: change from 'absent' to 'directory' failed: Could not set 'directory' on ensure: Permission denied - /var/puppet/server/data/puppetserver/locales` )

4) `echo '127.0.0.1 puppet' >> /etc/hosts`
5) `mv /usr/local/etc/puppet /usr/local/etc/puppet-o`
6) `git clone https://github.com/olevole/puppet-empty.git /usr/local/etc/puppet`
7) `rm -rf /usr/local/etc/puppet/.git`
8) `chown -R puppet:puppet /var/puppet`
9) `service puppetserver enable`
10) `service puppetserver start`
11) // wait for java/puppetservice process fully started ( ~10-15 sec: check when CPU consumption by process will be low )
12) check puppetserver/puppet agent: `puppet agent -t`
13) drop 'code/modules' dir into /usr/local/etc/puppet/ e.g: https://forge.puppet.com/zleslie/pkgng
``` 
   puppet module install zleslie-pkgng
```
14) `ln -sf /usr/local/etc/puppet/modules /usr/local/etc/puppet/code/environments/modules`

# Usage

- Use /usr/local/etc/puppet/code/environments/production/data/nodes directory to assign role per host
- Use /usr/local/etc/puppet/code/environments/production/data/role directory to describe role

# GitLab integration
