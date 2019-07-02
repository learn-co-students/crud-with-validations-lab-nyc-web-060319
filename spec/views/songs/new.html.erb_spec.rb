RSpec.describe "songs/new", type: :feature do
  it "renders form" do
    visit new_song_path

    form = find("#new_song")

    expect(form.find("#song_title")[:name]).to eq("song[title]")
    expect(form.find("#song_release_year")[:name]).to eq("song[release_year]")
    expect(form.find("#song_released")[:name]).to eq("song[released]")
    expect(form.find("#song_genre")[:name]).to eq("song[genre]")
    expect(form.find("#song_artist_name")[:name]).to eq("song[artist_name]")
  end
end
