desc "Scrape filters data"
task :scrape_filters_data => :environment do
  Filters::BackfillDataWorker.new.perform
end
