class Cases::BackfillDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'cases'

  def perform
    Cases::BackfillData.new.perform
  end
end