require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require './environments'
require './models/playlist'

get "/" do
 @title = 'Guess Whos Playlist'
 @playlists = Playlist.all
 erb :"playlist/index"
end

get "/new" do
  @title = 'Add your playlist - Guess Whos Playlist'
  erb :"playlist/new"
end
