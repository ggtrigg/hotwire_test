class Album::Create < BrowserAction
  accepted_formats [:html, :turbo_stream], default: :turbo_stream
  
  post "/album" do
    Log.info { "html: #{html?}, turbo-stream: #{accepts?(:turbo_stream)}" }
    SaveAlbum.upsert(params) do |operation, album|
      Log.info { operation }
      if album
        if operation.new_record?
          album_ts = Album::StreamAppend.new(album: album)
          send_text_response(album_ts.render_to_string, content_type: "text/vnd.turbo-stream.html")
        else
          flash.info = "Album '#{album.name}' already exists"
          flash_ts = Shared::FlashMessages.new(flash: flash, use_turbo: true)
          send_text_response(flash_ts.render_to_string, content_type: "text/vnd.turbo-stream.html")
        end
      else
        flash.failure = "Error creating album. #{operation.errors.join(", ")}"
        flash_ts = Shared::FlashMessages.new(flash: flash, use_turbo: true)
        send_text_response(flash_ts.render_to_string, content_type: "text/vnd.turbo-stream.html")
      end
    end
  end
end
