class Coin::NewForm < BaseComponent
  needs coin_op : SaveCoin
  needs album : Album

  # needs error : String?

  def render
    tag "turbo-frame", id: "coins" do
      h3 "#{album.name} - Add coin"
      form_for Coin::Create.with(album_id: album.id) do
        div class: "mb-3 form-floating" do
          text_input coin_op.country, attrs: [:required], class: "form-control", placeholder: "Country"
          label_for coin_op.country, class: "form-label"
        end
        div class: "mb-3 form-floating" do
          text_input coin_op.denomination, attrs: [:required], class: "form-control", placeholder: "Denomination"
          label_for coin_op.denomination, class: "form-label"
        end
        div class: "mb-3 form-floating" do
          number_input coin_op.value, attrs: [:required], class: "form-control", placeholder: "Value"
          label_for coin_op.value, class: "form-label"
        end
        div class: "d-flex" do
          span do
            link "Cancel", to: Album::Show.with(album), class: "btn btn-danger"
          end
          span class: "ms-auto" do
            submit "Create coin", class: "btn btn-primary"
          end
        end
      end
    end
  end
end
