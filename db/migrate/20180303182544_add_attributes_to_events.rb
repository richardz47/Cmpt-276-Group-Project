class AddAttributesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location, :string
    add_column :events, :auto, :string
    add_column :events, :duration, :string
    add_column :events, :lat, :float, {:precision=>10, :scale=>6}
    add_column :events, :long, :float, {:precision=>10, :scale=>6}
  end
end
