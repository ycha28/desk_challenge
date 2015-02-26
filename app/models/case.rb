class Case < ActiveRecord::Base
  has_one :message, :dependent => :destroy
  has_and_belongs_to_many :filters
  has_and_belongs_to_many :labels

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
    Messages::BackfillData.perform_at(10.seconds.from_now, id)
  end

  def backfill_label_data(label_ids)
    label_ids.each do |label_id|
      Labels::BackfillData.perform_at(10.seconds.from_now, id, label_id)
    end
  end
end