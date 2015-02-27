class Cases::UpdateWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'cases'

  def perform(id)
    Cases::Update.new(id).perform
  end
end