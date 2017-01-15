package ParseAd;
use Data::Dumper qw(Dumper);
use strict;
use warnings;


# NOTE: There is no need to add anyting outside of this function
sub ad_fields
{
    my %result=(title => '',
                location=>'',
                sector=>'',
                description=>'',
                id=>''
         );
         my @results;
	my $filename = shift;
    open(my $fh, "<:encoding(UTF-8)", $filename)   #open file
     || die "Can't open UTF-8 encoded $filename: $!";
     
    while (my $line = <$fh>){
     
    
    if ($line =~  m/.*?(itemprop="title">.*?h1>).*/s){ #find title
       my @string = split /[<>]/, $line;
        my $title = $string[2];
        $results[0] = $title;
         
    }
   
    
    if ($line =~  m/.*?(<span itemprop="jobLocation">.*?<br).*/s){ #find location
        my @string = split /[<>]/, $line;
        my $location =$string[12] .' '. $string[14];
      
        $results[1]=$location;
    }
    
    
    if ($line =~  m/.*?("Industry".*?<br).*/s){  #find sector
        my @string = split /[<>]/, $line;
        my $sector =$string[22];
       $results[2]=$sector;
    
    }
    
      if ($line =~  m/.*?(<span itemprop="description">.*?span>).*/s){ #find description
        my @string = split /[<>]/, $line;
        my $description =$string[2];
        print $description;
        $results[3]=$description;
    }
    
     if ($line =~  m/.*?('job.*?-).*/s){    # find id
        my @string = split /[job-]/, $line;
        my $id =$string[3];
        $id = substr ($id,1,7);
        $results[4] = $id;
     
      
    }
    
  
 
    
    
    
    }
        %result=(       #assign values from array to hash
            title=>$results[0],
            location=>$results[1],
            sector=>$results[2],
            description=>$results[3],
            id=>$results[4]
        );
        
      print Dumper \%result;
      
	return {};
}

ad_fields('data/001-ad.html');
 

1;
__END__
