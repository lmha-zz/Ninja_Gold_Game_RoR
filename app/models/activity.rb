class Activity < ActiveRecord::Base
  validates :location, inclusion: { in: %w(Farm Cave House Casino), message: '%(value) is not a valid location.' }, presence: true
  validates :gold, numericality: true, presence: true

  def self.reset
    self.all.delete_all
  end

end
