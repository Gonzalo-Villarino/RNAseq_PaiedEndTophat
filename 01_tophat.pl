use strict;
use warnings;

open(FILE,"/home3/gonzalo/Angelina/00_cleaned.reads/file.names.txt") or die;
while(<FILE>){
	chomp;
	my $name = $_;
	$name =~ s/\.R1\.fq.gz//;
	$name =~ s/\.R2\.fq.gz//;
	open(OUT,">$name.sh") or die;
	print OUT "#!/bin/bash\n";
	print OUT "tophat2 -G /home3/gonzalo/Angelina/gene.models/TN90.gene_models.gff -o /home3/gonzalo/Angelina/01_tophat/tophat_$name --library-type=fr-firststrand /home3/gonzalo/Angelina/indexed.genome/genome /home3/gonzalo/Angelina/00_cleaned.reads/$name.R1.fq.gz /home3/gonzalo/Angelina/00_cleaned.reads/$name.R2.fq.gz";
	print "$name\n";
	close OUT;
}
close FILE;
