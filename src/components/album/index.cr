class Component::Album::Index < BaseComponent
  def render
    tag "turbo-frame", id: "albums", target: "coins" do
        div class: "row" do
        AlbumQuery.new.each do |album|
          div class: "col-sm-4" do
            link album.name, to: ::Album::Show.with(album)
          end
        end
      end
    end
  end
end
