class AddPositionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position, :string
    add_column :users, :roles, :integer, default:0
  end
end
