#!/usr/bin/perl

use warnings;
use strict;

use YAML::XS;
use Test::More tests => 3;


my $test_data = YAML::XS::LoadFile( 't/tests.yaml' );

# 1. Load ParseAd module
require_ok( 'ParseCSV' );

# 2. Test for ad_fields function
can_ok( 'ParseCSV', qw( sort_by_population ) );

# 3. Test for result string
my $csv_content  = $test_data->{test_part_2}{input};
my $answer       = $test_data->{test_part_2}{output};

is( ParseCSV::sort_by_population( $csv_content ), $answer, 'Population' );
