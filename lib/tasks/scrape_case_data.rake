desc "Scrape case data"
task :scrape_case_data => :environment do
  Cases::BackfillData.perform_async
end
