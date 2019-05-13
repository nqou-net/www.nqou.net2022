#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Data::Printer {deparse => 1, caller_info => 1};

use Date::Japanese::Era;

{
    my $era = Date::Japanese::Era->new(2019, 5, 1);
    p $era->name;
    p $era->year;
}
{
    my $era = Date::Japanese::Era->new(2019, 4, 30);
    p $era->name;
    p $era->year;
}

{
    my $era = Date::Japanese::Era->new("令和", 1);
    p $era->gregorian_year;
}
