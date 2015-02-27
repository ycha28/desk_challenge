class Labels::BackfillCaseDataWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'labels'

  def perform(case_id, label_service_id)
    Labels::BackfillCaseData.new(case_id, label_service_id).perform
  end
end