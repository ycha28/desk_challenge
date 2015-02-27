class Filters::BackfillData
  def perform
    filters_data.each do |filter_data|
      filter = Filter.find_or_initialize_by(service_id: filter_data.id)
      filter.backfill_data(filter_data)
      filter.backfill_cases_data
    end
  end

  def filters_data
    @filters_data ||= Desk.filters.entries
  end
end