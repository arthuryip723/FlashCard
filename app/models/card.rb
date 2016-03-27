class Card < ActiveRecord::Base
  belongs_to :deck
  before_save :default_values

  def default_values
    self.state ||= 'AGAIN'
  end
end
