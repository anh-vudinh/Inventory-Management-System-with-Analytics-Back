class CreateRoleResources < ActiveRecord::Migration[6.1]
  def change
    create_table :role_resources do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
