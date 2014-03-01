use utf8;
use v5.12;

use Cinnamon::DSL;

set user       => 'nqounet';
set repository => 'git@gitlab.nishimiyahara.net:nqounet/web-nqou_net.git';

role
    production => ['sakura.nqounet'],
    {
        deploy_to   => '/home/nqounet/www/web-nqou_net',
        branch      => 'master',
    };

task deploy => {
  setup => sub {
    my ($host, @args) = @_;
    my $repository = get('repository');
    my $deploy_to  = get('deploy_to');
    remote {
      run
        qq{git clone $repository $deploy_to};
    }
    $host;
  },
  update => sub {
    my ($host, @args) = @_;
    my $deploy_to = get('deploy_to');
    my $branch    = 'origin/' . get('branch');
    remote {
      run
        qq{cd $deploy_to && git fetch origin && git checkout $branch && git submodule update --init};
    }
    $host;
  },
};

task server => {
  restart => sub {
    my ($host, @args) = @_;
    my $deploy_to = get('deploy_to');
    remote {
      sudo qq{bash $deploy_to/bin/restart.sh};
    }
    $host;
  },
};
