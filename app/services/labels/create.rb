class Labels::Create
  attr_reader :label
  def initialize(id)
    @label = Label.find(id)
  end

  def perform
    response = Desk.create_label(name: label.name)
    label.update(service_id: response.id)
  end
end