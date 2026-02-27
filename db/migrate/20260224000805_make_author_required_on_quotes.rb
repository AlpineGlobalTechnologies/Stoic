class MakeAuthorRequiredOnQuotes < ActiveRecord::Migration[8.0]
  def change
    change_column_null :quotes, :author_id, false
  end
end