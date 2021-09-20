class Coin < BaseModel
  table do
    column country : String
    column denomination : String
    column value : Int32
    belongs_to album : Album
  end
end
