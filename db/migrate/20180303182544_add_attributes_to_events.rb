class AddAttributesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location, :string
    add_column :events, :auto, :string
  end
end
