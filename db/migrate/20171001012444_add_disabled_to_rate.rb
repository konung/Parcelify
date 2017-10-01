class AddDisabledToRate < ActiveRecord::Migration[5.1]
  def change
    add_column :rates, :disabled, :boolean, null: false, default: false
    add_index(:rates, [:shop_id, :disabled])
  end
end
