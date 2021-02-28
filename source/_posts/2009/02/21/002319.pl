#!/usr/bin/perl
use strict;
use warnings;
use Benchmark qw(:all);
use Perl6::Say;

sub confirm ($) {

    #    say shift;
}
cmpthese(
    100000,
    {
        sub_foreach_normal => sub {
            my $sum = 0;
            foreach my $i (1 .. 100) {
                $sum += $i;
            }
            confirm $sum;
        },
        sub_while_continue => sub {
            my $sum = 0;
            my $i   = 1;
            while ($i < 101) {
                $sum += $i;
            }
            continue {
                $i++;
            }
            confirm $sum;
        },
        sub_for => sub {
            my $sum = 0;
            for (my $i = 1; $i < 101; $i++) {
                $sum += $i;
            }
            confirm $sum;
        },
    }
);
