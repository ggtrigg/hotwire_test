class Coin::List < BaseComponent
  
  needs album : Album

  def render
    tag "turbo-frame", id: "coins" do
      h3 album.name
      table class: "table" do
        tr do
          th "Country", scope: "col"
          th "Coin", scope: "col"
        end
        get_coin_list
      end
    end
  end
  
  def get_coin_list
    album.coins.each do |coin|
      tr do
        td coin.country
        td "#{coin.value} #{coin.denomination}"
      end
    end
  end
end
