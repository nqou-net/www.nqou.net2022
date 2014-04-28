#!/usr/bin/env perl
use utf8;
use 5.012;

use Data::Printer;
use JSON::XS qw(decode_json);
use Path::Tiny qw(path);

my $json = decode_json(path('package.json')->slurp);
for my $key (sort keys $json->{devDependencies}) {
    print qq{
        system(qq{npm install -D $key});
    };
}
