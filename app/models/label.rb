class Label < ActiveRecord::Base
  has_and_belongs_to_many :cases

  validates_presence_of :name

  def backfill_data(label_data)
    self.name = label_data.name
    self.description = label_data.description
    save
  end
end