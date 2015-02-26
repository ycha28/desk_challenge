desc "Scrape filters data"
task :scrape_filters_data => :environment do
  Filters::BackfillData.perform_async
end
