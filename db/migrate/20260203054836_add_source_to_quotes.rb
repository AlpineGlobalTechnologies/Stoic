class AddSourceToQuotes < ActiveRecord::Migration[8.0]
  def change
    add_column :quotes, :source, :string
  end
end
