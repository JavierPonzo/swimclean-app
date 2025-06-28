class AddWaterTemperatureToAreas < ActiveRecord::Migration[8.0]
  def change
    add_column :areas, :water_temperature, :float
  end
end
