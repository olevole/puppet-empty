# Global Defaults
Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin" }

$role_config = lookup( { 'name' => 'role', 'default_value' => 'stale' } )
$project_config = lookup( { 'name' => 'project', 'default_value' => 'unknown' } )
$dc_config = lookup( { 'name' => 'dc', 'default_value' => 'unknown' } )

case size($role_config) {
  0: { fail("Please specify any role") }
}

hiera_include('classes')
