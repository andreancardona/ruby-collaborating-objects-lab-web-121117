require_relative 'artist'
require_relative 'song'

class MP3Importer

  attr_accessor :name, :path

  @@all = []

  def initialize(path)
    @path = path

  end

    def files
      Dir.entries(@path).each do |file|
        if file.include?("mp3")
          @@all << file
        end
      end
      @@all
    end
  #files
   #loads all the mp3 files in the path directory (FAILED - 1)
   #normalizes the filename to just the mp3 filename with no path (FAILED - 2)
  def import
     @@all.each do |file|
     new_song = Song.new_by_filename(file)
     new_song.artist.add_song(new_song)
    end
    @@all
  end

#MP3Importer #import imports the files into the library by creating songs from a filename
     #Failure/Error: exct(Artist.all.size).to eq(3)


end
