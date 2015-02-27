class Messages::BackfillDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'messages'

  def perform(case_id)
    Messages::BackfillData.new(case_id).perform
  end
end