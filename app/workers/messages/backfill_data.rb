class Messages::BackfillData
  include Sidekiq::Worker
  sidekiq_options queue: 'messages'

  def perform(case_id)
    Messages::MessageScraper.new(case_id).perform
  end
end