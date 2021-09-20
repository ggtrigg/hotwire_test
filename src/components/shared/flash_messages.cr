class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    flash.each do |flash_type, flash_message|
      div class: "row" do
        div class: "col flash-#{flash_type}", flow_id: "flash" do
          text flash_message
        end
      end
    end
  end
end
