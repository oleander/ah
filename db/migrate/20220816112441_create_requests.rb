class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :phone_number
      t.integer :area

      t.timestamps
    end
  end
end
