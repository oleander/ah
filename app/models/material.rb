# frozen_string_literal: true

class Material < ApplicationRecord
  validates :name, uniqueness: true
end
