class Song
  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @genre = genre
    @artist = artist
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

  def self.create(name)  # this method bypasses #initialize!
    @@all << Song.new(name).save
  end

  def artist=(name)
    @artist = name
    artist.add_song(name)
  end

end
