class Material < ApplicationRecord
  validates :name, uniqueness: true
end
