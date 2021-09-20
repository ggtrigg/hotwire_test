class CreateAlbums::V20210918105500 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Album) do
      primary_key id : Int64
      add_timestamps
      add name : String
    end
  end

  def rollback
    drop table_for(Album)
  end
end
