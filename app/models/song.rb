class Song < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validate :year_valid

  def year_valid
    year_title_combo = Song.all.map do |song|
      [song.title, song.release_year]
    end
    if released && release_year.nil?
      errors.add(:release_year, "can't be nil if released is true.")
    elsif release_year.present? && release_year > 2019
      errors.add(:release_year, "can't be in the future.")
    elsif year_title_combo.include?([title, release_year])
      errors.add(:title, "can't be the same as another song in the same year.")
    end
  end
end
