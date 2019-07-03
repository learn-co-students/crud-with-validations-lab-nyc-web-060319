class Song < ApplicationRecord
    validates :title, length: {minimum: 1}
    validates :released, inclusion: {in: [true,false]}
    # validates :release_year, presence: true, if: @released
    validate :valid_release_year
    validate :valid_song_name
    validates :artist_name, length: {minimum: 1}


    def valid_release_year
        # if title == "Talisman"
        #     byebug
        # end
        if released
            # byebug
            if release_year == nil
                # byebug
                errors.add :release_year
                return
            end
            if release_year > DateTime.now.year
                # byebug
                errors.add :release_year
            end
        end
        true
    end

    def valid_song_name
        songs = Song.all.select{ |song| (song != self) && (song.release_year == release_year)}
        # byebug
        same_title = songs.select {|found_song| found_song.title == title}
        # byebug
        if same_title.length > 0
            errors.add :title
            return
        else
            return true
        end
    end

    def to_s
        # byebug
        "Title: #{title}, Released: #{released}, Release Year: #{release_year}, Artist Name: #{artist_name}, Genre: #{genre}, Created: #{created_at}, Updated: #{updated_at}"
    end
end
