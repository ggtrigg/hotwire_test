class Album < BaseModel
  table do
    column name : String
    has_many coins : Coin
  end
end
