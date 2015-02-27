class Labels::BackfillDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'labels'

  def perform
    Labels::BackfillData.new.perform
  end
end