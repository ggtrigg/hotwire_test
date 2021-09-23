abstract class MainLayout
  include Lucky::HTMLPage

  abstract def content
  abstract def page_title

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "Welcome"
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body do
        div class: "container mt-4" do
          div class: "row" do
            tag "turbo-frame", id: "flash" do
              mount Shared::FlashMessages, context.flash
            end
          end
          content
        end
      end
    end
  end
end
