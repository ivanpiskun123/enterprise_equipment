class Bid < ApplicationRecord
  after_initialize :init

  belongs_to :user, :nomination, :breakdown_cause, :unit

  validates_associated :user, :nomination
  validates_presence_of :user, :nomination

  validates :is_urgent, :is_viewed, presence: true

  def init
    self.is_urgent = false  if self.is_urgent.nil?
    self.is_viewed = false if self.is_viewed.nil?
  end

  


end
