# README

### Development

```
rails g scaffold Alignment sequence:string flags:integer reference:string chromosome:string position:integer cigar:string --no-stylesheets --no-helper --no-javascripts --no-jbuilder --no-assets
```


For some reason, it appears that `bundle exec autotest` uses the develpoment environment? Create and update controller tests fail due to CSRF verification failure. Need to use `RAILS_ENV=test bundle exec autotest`



Using my modified bowtie2 2.2.9 which outputs = or X rather than just the ambiguous M.


See app/views/statics/index.html.erb for all the details.

