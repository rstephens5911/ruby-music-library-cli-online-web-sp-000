class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = new(name) # this method bypasses #initialize!
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist #guard clause
    songs << song unless songs.include?(song) # guard clause
  end

  def genres
    songs.map(&:genre).uniq
  end

end
