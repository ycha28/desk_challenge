class Filter < ActiveRecord::Base
  has_and_belongs_to_many :cases

  scope :active, -> { where(active: true) }

  def backfill_data(filter_data)
    self.name = filter_data.name
    self.active = filter_data.active
    self.position = filter_data.position
    save
  end

  def backfill_cases_data
    Filters::BackfillCasesDataWorker.perform_at(10.seconds.from_now, id)
  end
end