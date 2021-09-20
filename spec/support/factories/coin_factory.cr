class CoinFactory < Avram::Factory
  def initialize
    country %w(Australia United\ States Japan Brazil New\ Zealand).sample
    denomination %w(Penny Cent Dollar Rouble Yen).sample
    value [1, 2, 5, 10, 20, 50].sample
    album_id AlbumQuery.new.to_a.sample.id
  end
end