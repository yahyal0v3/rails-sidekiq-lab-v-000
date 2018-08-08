class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |line|
      song = Song.create(title: line[0], artist_name: line[1])
    end
  end
end
