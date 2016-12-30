package ParseAd;
use Data::Dumper;
use strict;
use warnings;

sub ad_fields {

            my($paramName) = @_; #pass parameter
            my %result;

            my $filename = "data/$paramName.html";
            
              open(my $fh, "<:encoding(UTF-8)", $filename)   #open file
                || die "Can't open UTF-8 encoded $filename: $!";
                
               while (my $title = $fh) {

                    if ( $title =~ /title">(.*?)h1>/) {

                        print $title;
                        %result=(title => $title,
                                location => '',
                                sector => '',
                                description => '',
                                id => ''
                        );

                    }
                
                    my $location = '/jobLocation">(.*?)<b>/';
                   if ( $title =~ $location) {
                        print $location;
                        %result=(
                                location => $title,
                                sector => '',
                                id => ''
                        );

                    }
                    


                        my $sector = '/Sector:(.*?)Medical/';
                    if (  $title =~ $sector ) {
                        print $sector;
                        %result=(
                                sector => $title,
                                id => ''
                        );

                    }
                        my $description='/description">(.*?)beneficial/';
                     if (  $title =~ $description ) {
                        print $description;
                        %result=(
                                decription => $title,
                                id => ''
                        );

                    }
                        my $id = '/(.*?)/';
                    if (  $title =~ $id) { #i cant find the id in the ad
                        print $id;
                        %result=(

                                id => $title
                        );
                      
                    }



            }

                  
         return %result;         
    } #end of sub
    
      print "enter file name\n";
      my $name = <STDIN>;
      chomp $name;
      ad_fields($name); #call Sub
        
        
        
        
        
        
      
1;
__END__
