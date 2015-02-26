class Filters::CaseDataScraper
  attr_reader :filter
  def initialize(id)
    @filter = Filter.find(id)
  end

  def filtered_case_service_ids
    Desk.filter_cases(filter.service_id).map(&:id)
  end

  def filtered_case_ids
    Case.where(service_id: filtered_case_service_ids).pluck(:id)
  end

  def perform
    filter.case_ids = filtered_case_ids
  end
end