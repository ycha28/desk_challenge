class Filters::BackfillCasesData
  include Sidekiq::Worker
  sidekiq_options queue: 'filters'

  def perform(id)
    Filters::CaseDataScraper.new(id).perform
  end
end