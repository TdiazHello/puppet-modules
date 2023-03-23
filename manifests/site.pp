exec { 'my_exec_command':
  command => 'ls -alrt',
  patch => '/user/bin:/usr/local/bin',
  cwd => '/etc/puppetlasbs/puppet',
  logoutput => true,
}

$result = []
Exec['my_exec_command']->Notify[ 'result']

notify{'results':
  message => "c'est la directory puppet : ${result}",
}

$result = split(trim($::output),"\n")

