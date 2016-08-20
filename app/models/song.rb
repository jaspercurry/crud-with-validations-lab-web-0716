class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :only_year
  validate :no_release


  def only_year
    year = self.release_year
    title = self.title
    artist = self.artist_name
    Song.all.each do |song|
      if song.artist_name == artist && song.title == title && song.release_year == year
        errors.add(:title, "can't have mutiple songs with the same title from the same artist in one year")
      end
    end
  end


  def no_release
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Must not be blank if released is true")
    elsif self.release_year != nil && self.release_year > Time.now.year
      errors.add(:release_year, "Can't release movies in the future")
    end
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Must have a release year")
    end


  end

end
