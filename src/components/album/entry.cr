class Album::Entry < BaseComponent
  
  needs album : Album
  
  def render
    div class: "col-sm-auto album-name", id: "album-#{album.id}" do
      link album.name, to: ::Album::Show.with(album)
      link to: Album::Delete.with(album), type: "button", class: "btn btn-close btn-sm", aria_label: "Close", data_method: "delete",
        data_confirm: "Really delete album '#{album.name}'?", rel: "nofollow"
    end
  end
end
