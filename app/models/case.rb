class Case < ActiveRecord::Base
  def backfill_data(params)
    self.blurb = params.blurb
    self.subject = params.subject
    self.priority = params.priority
    self.description = params.description
    self.status = params.status
    self.remote_updated_at = params.updated_at
  end
end