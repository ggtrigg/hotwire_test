class Album::Entry < BaseComponent
  
  needs album : Album
  
  def render
    div class: "col-sm-4" do
      link album.name, to: ::Album::Show.with(album)
    end
  end
end
