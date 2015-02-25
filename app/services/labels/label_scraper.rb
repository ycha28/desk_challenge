class Labels::LabelScraper
  attr_reader :desk_case, :label_id, :label_data
  def initialize(case_id, label_id)
    @desk_case = Case.find(case_id)
    @label_id = label_id
  end

  def label_data
    @label_data ||= Desk.label(label_id)
  end

  def perform
    desk_case.labels.create(service_id: label_data.id, name: label_data.name, description: label_data.description)
  end
end