# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :partner
  belongs_to :material

  validates :partner, presence: true, uniqueness: { scope: :material }
  validates :material, presence: true, uniqueness: { scope: :partner }
end
