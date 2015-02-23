class Case < ActiveRecord::Base
  def backfill_data(params)
    self.blurb = params.blurb
    self.subject = params.subject
    self.priority = params.priority
    self.description = params.description
    self.status = params.status
    self.changed_at = params.changed_at
  end
end