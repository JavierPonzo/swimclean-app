class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.references :area, null: false, foreign_key: true
      t.string :algae_level
      t.text :comment

      t.timestamps
    end
  end
end
