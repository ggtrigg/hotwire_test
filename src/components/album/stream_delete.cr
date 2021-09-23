class Album::StreamDelete < BaseComponent
  needs album : Album

  def render
    tag "turbo-stream", action: "remove", target: "album-#{album.id}"
  end
end
