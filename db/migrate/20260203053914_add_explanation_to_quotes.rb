class AddExplanationToQuotes < ActiveRecord::Migration[8.0]
  def change
    add_column :quotes, :explanation, :string
  end
end
