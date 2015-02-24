class Case < ActiveRecord::Base
  has_one :message

  def backfill_data(params)
    self.service_id = params.id
    self.blurb = params.blurb
    self.subject = params.subject
    self.priority = params.priority
    self.description = params.description
    self.status = params.status
    self.remote_updated_at = params.updated_at
  end

  def backfill_message_data(id)
    message_data = Desk.case_message(id)

    if message.present?
      message.remote_created_at = message_data.created_at
      message.body = message_data.body
    else
      build_message(remote_created_at: message_data.created_at, body: message_data.body)
    end
  end
end