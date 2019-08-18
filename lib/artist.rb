class Artist
  attr_accessor :artist, :name, :genre, :songs

  @@all = []

  def initialize(name)
    @songs = []
    @artist = artist
    @name = name
    @genre = genre
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist)
    @@all << Artist.new(artist).save
  end

  def add_song(song)
    if (@songs.include?(song) || song.artist != @artist)
    else
      song.artist = self
      @songs << song
    end
  end


end
