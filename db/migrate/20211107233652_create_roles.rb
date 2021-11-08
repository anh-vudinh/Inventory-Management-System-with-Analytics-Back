class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :title
      t.string :description
      t.integer :clearance
      t.boolean :is_disabled
      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
