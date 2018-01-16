require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require './environments'
require './models/playlist'

get "/" do
 @title = 'Guess Whose Playlist'
 @playlists = Playlist.order("RANDOM()").all
 @names = @playlists.pluck(:owner)
 erb :"playlist/index"
end

post "/" do
  @title = 'Guess Whose Playlist'
  @playlists = Playlist.order("RANDOM()").all
  @names = @playlists.pluck(:owner)
  @params = params[:guesses]
  erb :"playlist/index"
end


post "/create" do
  if params[:playlist].has_key? :url
    @playlist = Playlist.new(params[:playlist])
    if @playlist.save
      redirect "/"
    else
      redirect "create"
    end
  else
    redirect "create"
  end
end

get "/create" do
  @title = 'Add your playlist - Guess Whose Playlist'
  erb :"playlist/create"
end

get "/delete_all" do
  if params[:password] = ENV['PASSWORD']
    Playlist.destroy_all
  end
  redirect "/"
end
