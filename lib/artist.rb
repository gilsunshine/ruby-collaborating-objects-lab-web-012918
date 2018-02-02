require 'pry'
class Artist

  @@all = []

  attr_reader :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find {|artist| artist.name == artist_name}
    if found_artist == nil
      self.new(artist_name)
    else
      found_artist
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
