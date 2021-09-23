class SaveAlbum < Album::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/saving-records#perma-permitting-columns
  #
  permit_columns name
  upsert_lookup_columns :name
end
