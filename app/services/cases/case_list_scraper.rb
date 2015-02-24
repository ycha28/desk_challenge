class Cases::CaseListScraper
  def perform
    cases_data.each do |case_data|
      desk_case = Case.find_or_initialize_by(service_id: case_data.id)
      desk_case.backfill_data(case_data)
      desk_case.backfill_message_data(case_data.id)
      desk_case.save
    end
  end

  def cases_data
    @cases_data ||= Desk.cases
  end
end