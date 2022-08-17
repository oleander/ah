# frozen_string_literal: true

class Request < ApplicationRecord
  has_many :requirements, dependent: :destroy
  has_many :materials, through: :requirements
  validates :phone_number, presence: true
  validates :area, numericality: { greater_than_or_equal_to: 0 }

  validates :lat, presence: true
  validates :lng, presence: true

  # A list of partners that are close to the request location and have the required materials.
  #
  # @return [ActiveRecord::Relation<Partner>]
  def partners
    distance = "earth_distance(ll_to_earth(partners.lat, partners.lng), ll_to_earth(%s, %s))" % [
      lat, lng
    ]

    Partner
      .select("partners.*, #{distance} AS distance")
      .where(materials:)
      .where("#{distance} <= partners.operating_radius")
      .joins(:materials)
      .group("partners.id")
  end
end
