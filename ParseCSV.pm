package ParseCSV;
use Data::Dumper qw(Dumper);
use strict;


sub sort_by_population
{
	my $csv_data = shift;

    my %data;

	my @lines = split( /\n/, $csv_data );
    
	foreach my $line (@lines)
	{
		my ($id,undef,$capital,$population) = split( /,/, $line );
		next if $id eq '1:id' ;
		$data{ $population } = $capital;
        
	}
	my ($max) = sort {$b <=> $a} keys %data;
  	return "$data{ $max } is the most populated capital";
}

#sort_by_population("1:id,2:country,3:capital,4:population
 #1,Greece,Athens,3.753
 #2,France,Paris,2.244
 #3,Poland,Warsaw,1.711");

1;
__END__
