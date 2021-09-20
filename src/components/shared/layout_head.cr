require "turbo"

class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title "My App - #{@page_title}"
      css_link "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css", defer: "true",
        data_turbolinks_track: "reload", integrity: "sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6",
        crossorigin: "anonymous"
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      script src: "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js", data_turbolinks_track: "reload",
        integrity: "sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf", crossorigin: "anonymous"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      raw Turbo.javascript_tag
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
