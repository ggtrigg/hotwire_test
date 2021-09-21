class Coin::Create < BrowserAction
  post "/album/:album_id/coin" do
    album = AlbumQuery.new.preload_coins.find(album_id)
    SaveCoin.upsert(params, album_id: album.id) do |operation, coin|
      if coin
        component Coin::List, album: album
      else
        component Coin::NewForm, coin_op: SaveCoin.new, album: album, error: "Error saving coin, try again."
      end
    end
  end
end
