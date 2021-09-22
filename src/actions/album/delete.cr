class Album::Delete < BrowserAction
  delete "/album/:album_id" do
    album = AlbumQuery.find(album_id)
    DeleteAlbum.delete(album) do |operation, deleted_album|
      if operation.deleted?
        del_stream = Album::StreamDelete.new(album)
        if session.get(:current_album) == album_id
          session.delete(:current_album)
          empty_coins = "<turbo-stream action=\"replace\" target=\"coins\"><template><turbo-frame id=\"coins\"></turbo-frame></template></turbo-stream>"
        else
          empty_coins = ""
        end
        send_text_response(del_stream.render_to_string + empty_coins, content_type: "text/vnd.turbo-stream.html")
      else
        plain_text "Error deleteing album '#{album.name}'"
      end
    end
  end
end
