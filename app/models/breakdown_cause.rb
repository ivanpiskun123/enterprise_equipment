class BreakdownCause < ApplicationRecord
  after_initialize :init

  belongs_to :unit

  validates_associated :unit
  validates_presence_of :unit

  validates :body, presence: true

  def init
    self.is_common = true if self.is_common.nil?
  end
end
