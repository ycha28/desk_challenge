class Cases::BackfillData
  include Sidekiq::Worker
  sidekiq_options queue: 'cases'

  def perform
    Cases::CaseListScraper.new.perform
  end
end