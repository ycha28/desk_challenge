desc "Scrape labels data"
task :scrape_labels_data => :environment do
  Labels::BackfillDataWorker.new.perform
end
