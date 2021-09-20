class Coin::New < BrowserAction
  get "/album/:album_id/coin/new" do
    album = AlbumQuery.find(album_id)
    component Coin::NewForm, coin_op: SaveCoin.new, album: album
  end
end
