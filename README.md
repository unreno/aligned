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



Using my modified bowtie2 2.2.9 which outputs = or X rather than just the ambiguous M.

```BASH
bowtie2 --very-sensitive -x hg19 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg19.vs.sam
bowtie2 --very-sensitive-local -x hg19 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg19.vsl.sam

bowtie2 --very-sensitive -x hg38 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg38.vs.sam
bowtie2 --very-sensitive-local -x hg38 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg38.vsl.sam

gawk 'BEGIN{OFS=","}(FNR==1){ ref=(FILENAME~/hg19/)?"hg19":"hg38"; }( /^@/ ){ next; }{ split($6,a,/[[:alpha:]=]/,s); eq=l=0; for(i=1;i<=length(s);i++){ l+=a[i]; if( s[i] == "=" ) eq+=a[i]; } percent_eq=100.0*eq/l; reverse=and($2,16)==16; ed=""; for(i=12;i<=NF;i++){ split($i,a,":"); if( a[1]=="NM" ) ed=a[3]; } percent_ed=100.0*ed/l; print $1,$2,reverse,ref,$3,$4,$6,eq,l,percent_eq,ed,percent_ed;}' SVAs_and_HERVs_KWHE.hg*.vs*.sam > alignments.csv


mysql -u root aligned_development -e 'TRUNCATE alignments'

mysql -u root --local-infile aligned_development -e "LOAD DATA LOCAL INFILE 'alignments.csv' INTO TABLE alignments FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reverse,reference,chromosome,position,cigar,length_eq,length_all,percent_eq,edit_distance,percent_ed)"


#	Production
mysql -u root -p --local-infile aligned_production -e "LOAD DATA LOCAL INFILE 'alignments.csv' INTO TABLE alignments FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reverse,reference,chromosome,position,cigar,length_eq,length_all,percent_eq,edit_distance,percent_ed)"
```



I noticed that, for HERVK113, the default --sensitive --end-to-end alignment finds a complete 100% match.
Using --very-sensitive-local finds to matches at the same position but fails to make a complete match.
I'm guessing that the presets are more appropriate for 100-200 bp reads, NOT 10,000.
Perhaps I should try meddling with these values.




percent_m is not as meaningful as expected. M can mean match or mismatch. Very sad that bowtie2 uses this SAM format allowed ambiguity. The CIGAR string needs to be used with great caution. The fields after the 11th column should be considered.


bowtie2 actually has = and X, but the code explicitly replaces them with Ms?
Recompiling bowtie2 from source

sed -i -e 's;^prefix = /usr/local$;prefix = /Users/jakewendt/.local;' Makefile
sed -i -e 's/buildCigar(false);/buildCigar(true);/' aln_sink.cpp
INC="-L /opt/local/lib/" make -e
make install





New versions of bowtie2 won't need the "buildCigar" modification
Next time, change "reverse:true,false" to "direction:R,F"


