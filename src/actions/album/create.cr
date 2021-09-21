class Album::Create < BrowserAction
  accepted_formats [:html, :turbo_stream], default: :turbo_stream
  
  post "/album" do
    Log.info { "html: #{html?}, turbo-stream: #{accepts?(:turbo_stream)}" }
    SaveAlbum.upsert(params) do |operation, album|
      if album
        album_ts = Album::StreamAppend.new(album: album)
        send_text_response(album_ts.render_to_string, content_type: "text/vnd.turbo-stream.html")
      else
        plain_text "Error creating album."
      end
    end
  end
end
