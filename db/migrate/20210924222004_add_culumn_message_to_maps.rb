class AddCulumnMessageToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :message, :text
  end
end
