class AddPolygonToAreas < ActiveRecord::Migration[8.0]
  def change
    add_column :areas, :polygon, :jsonb
  end
end
