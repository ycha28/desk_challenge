class Cases::BackfillData
  def perform
    cases_data.each do |case_data|
      desk_case = Case.find_or_initialize_by(service_id: case_data.id)
      desk_case.backfill_data(case_data)
      desk_case.backfill_message_data
      desk_case.backfill_label_data(case_data.label_ids)
    end
  end

  def cases_data
    @cases_data ||= Desk.cases
  end
end