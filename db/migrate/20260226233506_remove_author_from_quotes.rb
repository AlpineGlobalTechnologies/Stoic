class RemoveAuthorFromQuotes < ActiveRecord::Migration[8.0]
  def change
    remove_column :quotes, :author, :string
  end
end