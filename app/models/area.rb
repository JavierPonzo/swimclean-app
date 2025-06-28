class Area < ApplicationRecord
  has_many :reports, dependent: :destroy
  validate :polygon_must_be_valid

  private

  def polygon_must_be_valid
    return if polygon.blank?

    unless polygon.is_a?(Array) && polygon.length >= 3
      errors.add(:polygon, "must have at least 3 coordinate points")
    end
  end

  def latest_comments(limit = 3)
    reports.where.not(comment: [nil, ""]).order(created_at: :desc).limit(limit).pluck(:comment)
  end

end
