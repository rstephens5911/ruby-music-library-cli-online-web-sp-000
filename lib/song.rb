class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    # self.artist = artist will evoke artist= if there IS an artist
    self.genre = genre if genre
      # self.artist = artist will evoke artist= if there IS an artist
    save
  end

  def artist=(artist)
    @artist = artist # this is the main line of variable= method
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre  # this is the main line of variable= methods
    genre.songs << self unless genre.songs.include?(self) # unless = guard clause
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
    song = new(name)
    song.save
    song
  end
end
