class Case < ActiveRecord::Base
  has_one :message, :dependent => :destroy
  has_and_belongs_to_many :labels

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
    Messages::BackfillData.perform_async(id)
  end

  def backfill_label_data(label_ids)
    label_ids.each do |label_id|
      Labels::BackfillData.perform_async(id, label_id)
    end
  end
end