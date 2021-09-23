class Component::Album::Index < BaseComponent
  needs album_op : SaveAlbum = SaveAlbum.new

  def render
    tag "turbo-frame", id: "albums", target: "coins" do
      form_for ::Album::Create do
        div class: "row" do
          label_for album_op.name, class: "col-auto col-form-label"
          div class: "col-auto" do
            text_input album_op.name, class: "form-control"
          end
          div class: "col-auto" do
            submit "Create album", class: "btn btn-primary"
          end
        end
      end
      div class: "row mt-2", id: "album-list" do
        AlbumQuery.new.each do |album|
          mount ::Album::Entry, album: album
        end
      end
    end
  end
end
