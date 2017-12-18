require 'pry'
require_relative 'artist'
require_relative 'mp3_importer'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    filename_title = file_name.split(" - ")[1]
    filename_artist = file_name.split(" - ")[0]
    song_artist = Artist.find_or_create_by_name(filename_artist)
    new_song = Song.new(filename_title)
    new_song.artist = song_artist
    new_song
  end

end
