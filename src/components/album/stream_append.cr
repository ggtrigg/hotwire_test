class Album::StreamAppend < BaseComponent
  
  needs album : Album
  
  def render
    tag "turbo-stream", action: "append", target: "album-list" do
      tag "template" do
        mount Album::Entry, album: album
      end
    end
  end
end
