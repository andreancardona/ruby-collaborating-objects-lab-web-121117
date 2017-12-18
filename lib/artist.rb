require 'pry'
require_relative 'song'
require_relative 'mp3_importer'

class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist_object = Artist.all.find do |artist_name|
      artist_name.name == name
    end
    if artist_object
      artist_object
    else
      Artist.new(name)
    end
  end

  def print_songs
    @songs.map do |song_object|
      puts song_object.name
    end
  end


end
