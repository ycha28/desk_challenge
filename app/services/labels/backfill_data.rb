class Labels::BackfillData
  def perform
    labels_data.each do |label_data|
      label = Label.find_or_initialize_by(service_id: label_data.id)
      label.backfill_data(label_data)
    end
  end

  def labels_data
    @labels_data ||= Desk.labels
  end
end