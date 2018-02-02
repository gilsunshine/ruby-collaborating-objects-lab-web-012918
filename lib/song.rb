class Song

  attr_reader :name, :artist

  @@songs = []

  def initialize(name)
    @name = name
  end

  def add_song(song)
    @@songs << song
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end

  def self.new_by_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    new_song = Song.new(song_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_artist.add_song(new_song)
    new_song.artist=new_artist
    @@songs << new_song
    new_song
  end

end
