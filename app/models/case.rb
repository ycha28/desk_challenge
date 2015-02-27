class Case < ActiveRecord::Base
  has_one :message, :dependent => :destroy
  has_and_belongs_to_many :filters
  has_and_belongs_to_many :labels

  validates_presence_of :subject, :priority, :status

  scope :from_filters, ->(n) { joins(:filters).where(:filters => {:id => n}) }
 
  def backfill_data(params)
    self.service_id = params.id
    self.blurb = params.blurb
    self.subject = params.subject
    self.priority = params.priority
    self.description = params.description
    self.status = params.status
    self.remote_updated_at = params.updated_at
    save
  end

  def backfill_message_data
    Messages::BackfillDataWorker.perform_at(10.seconds.from_now, id)
  end

  def backfill_label_data(label_service_ids)
    self.labels = Label.where(service_id: label_service_ids)

    # If the labels cannot be found in the database, retrieve their data from Desk and create them in a worker
    new_labels = label_service_ids - labels.pluck(:service_id)
    new_labels.each do |label_id|
      Labels::BackfillCaseDataWorker.perform_at(10.seconds.from_now, id, label_id)
    end
  end
end