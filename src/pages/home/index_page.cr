class Home::IndexPage < MainLayout
  def page_title
    "Coin Collection (Hotwire Test)"
  end

  def content
    div class: "row" do
      div class: "col" do
        h1 "Coin Collection (Hotwire Test)"
      end
    end
    div class: "row my-4" do
      div class: "col" do
        para "A simple demo coin collection app comprising of multiple albums containing multiple coins. This is to demonstrate various components of the \"hotwire\" approach - namely turbo (using turbo-frame & turbo-stream) and stimulus (javascript framework)."
        tag "turbo-frame", id: "albums", src: Album::Index.route.path, target: "coins"
      end
    end
    div class: "row" do
      div class: "col" do
        tag "turbo-frame", id: "coins"
      end
    end
  end
end
