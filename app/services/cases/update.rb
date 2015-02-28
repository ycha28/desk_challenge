class Cases::Update
  attr_reader :case
  def initialize(id)
    @case = Case.find(id)
  end

  def case_attributes
    @case.attributes.slice('priority', 'description', 'subject', 'status').merge('label_ids' => @case.label_ids)
  end

  def perform
    Desk.update_case(@case.service_id, case_attributes)

    # Need to update filters as well
    Filters::BackfillDataWorker.new.perform
  end
end