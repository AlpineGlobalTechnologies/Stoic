class AddDateToQuotes < ActiveRecord::Migration[8.0]  # or [8.0] etc.
  def change
    add_column :quotes, :date, :date
    # Optional: add index if you'll query by date frequently
    add_index :quotes, :date, unique: true   # ← prevents two quotes on same day (if desired)
  end
end