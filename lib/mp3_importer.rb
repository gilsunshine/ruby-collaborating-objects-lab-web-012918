require 'pry'
class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select do |file|
      file.end_with?("3")
    end
  end

  def import
    
    files.each {|file| Song.new_by_filename(file)}

  end

end
