# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




### Development

```
rails g scaffold Alignment sequence:string flags:integer reference:string chromosome:string position:integer cigar:string --no-stylesheets --no-helper --no-javascripts --no-jbuilder --no-assets
```


For some reason, it appears that `bundle exec autotest` uses the develpoment environment? Create and update controller tests fail due to CSRF verification failure. Need to use `RAILS_ENV=test bundle exec autotest`




```BASH
bowtie2 --very-sensitive-local -x hg19 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg19.sam

bowtie2 --very-sensitive-local -x hg38 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg38.sam

samtools view SVAs_and_HERVs_KWHE.hg19.sam | gawk 'BEGIN{OFS=","}{ split($6,a,/[[:alpha:]]/,s); m=l=0; for(i=1;i<=length(s);i++){ l+=a[i]; if( s[i] == "M" ) m+=a[i]; } percent_m=100.0*m/l; reverse=and($2,16)==16; print $1,$2,reverse,"hg19",$3,$4,$6,m,l,percent_m;}' > hg19_alignments.csv

samtools view SVAs_and_HERVs_KWHE.hg38.sam | gawk 'BEGIN{OFS=","}{ split($6,a,/[[:alpha:]]/,s); m=l=0; for(i=1;i<=length(s);i++){ l+=a[i]; if( s[i] == "M" ) m+=a[i]; } percent_m=100.0*m/l; reverse=and($2,16)==16; print $1,$2,reverse,"hg38",$3,$4,$6,m,l,percent_m;}' > hg38_alignments.csv


mysql -u root aligned_development -e 'TRUNCATE alignments'


mysql -u root --local-infile aligned_development -e "LOAD DATA LOCAL INFILE 'hg19_alignments.csv'  INTO TABLE alignments  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reverse,reference,chromosome,position,cigar,length_m,length_all,percent_m)"

mysql -u root --local-infile aligned_development -e "LOAD DATA LOCAL INFILE 'hg38_alignments.csv'  INTO TABLE alignments  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reverse,reference,chromosome,position,cigar,length_m,length_all,percent_m)"
```



I noticed that, for HERVK113, the default --sensitive --end-to-end alignment finds a complete 100% match.
Using --very-sensitive-local finds to matches at the same position but fails to make a complete match.
I'm guessing that the presets are more appropriate for 100-200 bp reads, NOT 10,000.
Perhaps I should try meddling with these values.




percent_m is not as meaningful as expected. M can mean match or mismatch. Very sad that bowtie2 uses this SAM format allowed ambiguity. The CIGAR string needs to be used with great caution. The fields after the 11th column should be considered.


