package Repo::Identify;

use strict;
use warnings;

use Exporter;
our @ISA = 'Exporter';
our @EXPORT = qw[identify_repo];
our @EXPORT_OK = qw[identify_repos];

my @repos = (
  [ 'http://code.google.com/' => 'google',    ],
  [ 'git@github.com:'         => 'github',    ],
  [ 'http://github.com/'      => 'github',    ],
  [ 'https://github.com/'     => 'github',    ],
  [ 'https://bitbucket.org/'  => 'bitbucket', ],
  [ 'git://git.gnome.org/'    => 'gnome',     ],
  [ 'https://svn.perl.org/'   => 'perl',      ],
  [ 'git://'                  => 'git',       ],
  [ '\.git$'                  => 'git',       ],
  [ 'https?://svn\.'          => 'svn',       ],
);

sub identify_repo {

  foreach my $r (@repos) {
    return $r->[1] if $_[0] =~ /$r->[0]/;
  }

  return 'other';
}

sub identify_repos {
  return map { identify_repo($_) } @_;
}

1;
