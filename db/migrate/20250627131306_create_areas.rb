class CreateAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.float :algae_index
      t.integer :reports_count

      t.timestamps
    end
  end
end
