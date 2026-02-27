class AddAuthorToQuotes < ActiveRecord::Migration[8.0]
  def change
    add_reference :quotes, :author, foreign_key: true
  end
end
