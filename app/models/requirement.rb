class Requirement < ApplicationRecord
  belongs_to :request
  belongs_to :material

  validates :request, presence: true, uniqueness: { scope: :material }
  validates :material, presence: true, uniqueness: { scope: :request }
end
