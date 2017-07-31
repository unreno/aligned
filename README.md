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
bowtie2 -x hg19 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg19.sam

bowtie2 -x hg38 --no-unal --all -f -U SVAs_and_HERVs_KWHE.fasta -S SVAs_and_HERVs_KWHE.hg38.sam

samtools view SVAs_and_HERVs_KWHE.hg19.sam | gawk 'BEGIN{OFS=","}{ print $1,$2,"hg19",$3,$4,$6}' > hg19_alignments.csv

samtools view SVAs_and_HERVs_KWHE.hg38.sam | gawk 'BEGIN{OFS=","}{ print $1,$2,"hg38",$3,$4,$6}' > hg38_alignments.csv

mysql -u root --local-infile aligned_development -e "LOAD DATA LOCAL INFILE 'hg19_alignments.csv'  INTO TABLE alignments  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reference,chromosome,position,cigar)"

mysql -u root --local-infile aligned_development -e "LOAD DATA LOCAL INFILE 'hg38_alignments.csv'  INTO TABLE alignments  FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (sequence,flags,reference,chromosome,position,cigar)"
```







