class Request < ApplicationRecord
  validates :phone_number, presence: true
  validates :area, numericality: { greater_than_or_equal_to: 0 }

  validates :lat, presence: true
  validates :lng, presence: true

  has_many :requirements, dependent: :destroy
  has_many :materials, through: :requirements

  def partners
    q = "earth_distance(ll_to_earth(partners.lat, partners.lng), ll_to_earth(%s, %s))" % [lat, lng]
    Partner
      .joins(:materials)
      .where(materials: materials)
      .group("partners.id")
      .having("#{q} <= partners.operating_radius")
      .select("partners.*, #{q} AS distance")
  end

  def distance
    super
  end
end
