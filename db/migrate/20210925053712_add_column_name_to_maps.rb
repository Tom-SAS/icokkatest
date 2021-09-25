class AddColumnNameToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :name, :string
  end
end
