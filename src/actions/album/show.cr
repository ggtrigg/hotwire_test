class Album::Show < BrowserAction
  get "/album/:album_id" do
    album = AlbumQuery.new.preload_coins.find(album_id)
    component Coin::List, album: album
  end
end
