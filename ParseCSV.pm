package ParseCSV;

use strict;


sub sort_by_population
{
	my $csv_data = shift;

    my %data;

	my @lines = split( /\n/, $csv_data );
	foreach my $line (@lines)
	{
		my ($id,undef,$capital,$population) = split( /,/, $line );
		next if $id == '1:id' ;

		$data{ $population } = $capital;
	}
	my ($max) = sort {$a <=> $b} keys %data;

	return "$data{ $max } is the most populated capital";
}



1;
__END__
