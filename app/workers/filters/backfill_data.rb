class Filters::BackfillData
  include Sidekiq::Worker
  sidekiq_options queue: 'filters'

  def perform
    Filters::FiltersScraper.new.perform
  end
end