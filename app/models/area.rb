class Area < ApplicationRecord
  has_many :reports, dependent: :destroy
end

# app/models/report.rb
class Report < ApplicationRecord
  belongs_to :area

  after_create :update_area_index

  def update_area_index
    value = { 'none' => 0, 'medium' => 1, 'high' => 2 }[algae_level] || 0
    area.reports_count += 1
    area.algae_index = ((area.algae_index * (area.reports_count - 1)) + value) / area.reports_count
    area.save
  end
end
