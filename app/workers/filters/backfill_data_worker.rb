class Filters::BackfillDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'filters'

  def perform
    Filters::BackfillData.new.perform
  end
end