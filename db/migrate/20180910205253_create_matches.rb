class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :date
      t.string :place
      t.integer :matcher_id
      t.integer :matchee_id

      t.timestamps
    end
  end
end
