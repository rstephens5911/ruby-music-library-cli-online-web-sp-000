class MusicImporter
  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '') }
 end

 def import
   files.each { |file| Song.create_from_filename(file) }
 end

end
