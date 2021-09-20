class CreateCoins::V20210918105223 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Coin) do
      primary_key id : Int64
      add_timestamps
      add country : String
      add denomination : String
      add value : Int32
      
      add_belongs_to album : Album, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(Coin)
  end
end
