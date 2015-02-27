class Messages::BackfillData
  attr_reader :desk_case, :message_data
  def initialize(case_id)
    @desk_case = Case.find(case_id)
  end

  def message_data
    @message_data ||= Desk.case_message(desk_case.service_id)
  end

  def perform
    if desk_case.message.present?
      desk_case.message.update(remote_created_at: message_data.created_at, body: message_data.body)
    else
      desk_case.create_message(remote_created_at: message_data.created_at, body: message_data.body)
    end
  end
end