class CalorieIntake < ActiveRecord::Base
  before_save :default_values
  belongs_to :user
  validates :date, presence: true

  def default_values
    self.breakfast ||= 0
    self.lunch ||= 0
    self.dinner ||= 0
    self.snack ||= 0
  end
end
