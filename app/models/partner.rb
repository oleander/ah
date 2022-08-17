# frozen_string_literal: true

class Partner < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :materials, through: :experiences
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :operating_radius, numericality: { greater_than_or_equal_to: 0 }

  validates :lat, presence: true
  validates :lng, presence: true
end
