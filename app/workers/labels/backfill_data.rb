class Labels::BackfillData
  include Sidekiq::Worker
  sidekiq_options queue: 'labels'

  def perform(case_id, label_id)
    Labels::LabelScraper.new(case_id, label_id).perform
  end
end