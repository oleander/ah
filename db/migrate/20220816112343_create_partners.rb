# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.integer :rating
      t.integer :operating_radius
      t.timestamps
    end
  end
end
