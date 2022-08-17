# frozen_string_literal: true

class AddGeoToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :lat, :decimal, precision: 10, scale: 6
    add_column :requests, :lng, :decimal, precision: 10, scale: 6
    add_column :partners, :lng, :decimal, precision: 10, scale: 6
    add_column :partners, :lat, :decimal, precision: 10, scale: 6
  end
end
