class Filters::BackfillCasesDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'filters'

  def perform(id)
    Filters::BackfillCasesData.new(id).perform
  end
end