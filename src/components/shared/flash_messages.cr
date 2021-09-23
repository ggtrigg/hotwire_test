class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore
  needs use_turbo : Bool = false

  def render
    if use_turbo?
      tag "turbo-stream", action: "replace", target: "flash" do
        tag "template" do
          tag "turbo-frame", id: "flash" do
            flash_sections
          end
        end
      end
    else
      flash_sections
    end
  end

  def flash_sections
    flash.each do |flash_type, flash_message|
      div class: "col" do
        div class: "alert alert-#{flash_type.gsub("failure", "danger")} alert-dismissible", flow_id: "flash", role: "alert" do
          text flash_message
          button type: "button", class: "btn-close", data_bs_dismiss: "alert", aria_label: "Close"
        end
      end
    end
  end
end
