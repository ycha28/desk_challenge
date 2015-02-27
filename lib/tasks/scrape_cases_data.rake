desc "Scrape cases data"
task :scrape_cases_data => :environment do
  Cases::BackfillDataWorker.perform_async
end
