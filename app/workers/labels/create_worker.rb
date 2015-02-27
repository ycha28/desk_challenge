class Labels::CreateWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'labels'

  def perform(id)
    Labels::Create.new(id).perform
  end
end