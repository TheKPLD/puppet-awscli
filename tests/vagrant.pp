class { 'awscli': version => 'present' }
awscli::profile { 'vagrant-default':
  user                  => 'vagrant',
  aws_access_key_id     => 'MYTESTACCESSKEYID',
  aws_secret_access_key => 'MYTESTSECRETACCESSKEY',
  ;
'vagrant-s3':
  profile_name          => 'vagrant-s3',
  user                  => 'vagrant',
  aws_access_key_id     => 'MYTESTACCESSKEYID',
  aws_secret_access_key => 'MYTESTSECRETACCESSKEY',
  s3                    => { multipart_chunksize    => '100MB', max_concurrent_requests => '20' },
  ;
}
