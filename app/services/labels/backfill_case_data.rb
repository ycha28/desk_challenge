class Labels::BackfillCaseData
  attr_reader :desk_case, :label_service_id
  def initialize(case_id, label_service_id)
    @desk_case = Case.find(case_id)
    @label_service_id = label_service_id
  end

  def perform
    desk_case.labels.create(name: label_data.name, description: label_data.description, service_id: label_service_id)
  end

  def label_data
    @label_data ||= Desk.label(label_service_id)
  end
end