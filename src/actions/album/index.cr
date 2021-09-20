class Album::Index < BrowserAction
  get "/albums" do
    component Component::Album::Index
  end
end
