#!/usr/bin/perl

use warnings;
use strict;

use YAML::XS;
use Test::More tests => 12;


my $test_data = YAML::XS::LoadFile( 't/tests.yaml' );

# 1. Load ParseAd module
require_ok( 'ParseAd' );

# 2. Test for ad_fields function
can_ok( 'ParseAd', qw( ad_fields ) );

# 3. Test all parsed ad fields
foreach my $ad (@{ $test_data->{test_part_1} })
{
	my $file = $ad->{file};
	my $parsed_fields = ParseAd::ad_fields( "data/$file" );

	foreach my $field ( keys %$ad )
	{
		next if $field eq 'file';

		is( $parsed_fields->{$field}, $ad->{$field}, "*$field* for $file" );
	}
}
