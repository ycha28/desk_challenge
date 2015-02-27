class Message < ActiveRecord::Base
  belongs_to :case
  validates_presence_of :body

  before_save :format_body

  private

  def format_body
    self.body = body.split(/\n/).join('<br>')
  end
end