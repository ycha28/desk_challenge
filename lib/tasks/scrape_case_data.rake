desc "Scrape case data"
task :scrape_case_data => :environment do
  Cases::DailyScraper.perform_async
end
