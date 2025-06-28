class Report < ApplicationRecord
  belongs_to :area

  validates :area_id, :algae_level, presence: true

  after_create :update_area_index

  def update_area_index
    value = { 'clean' => 0, 'medium' => 1, 'high' => 2 }[algae_level] || 0
    # Seguridad por si es nil
    area.reports_count ||= 0
    area.algae_index ||= 0

    # Update rolling average
    area.reports_count += 1
    area.algae_index = ((area.algae_index * (area.reports_count - 1)) + value) / area.reports_count
    area.save
  end
end
