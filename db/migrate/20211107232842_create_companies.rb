class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.date :established
      t.string :description
      t.boolean :is_parent
      t.boolean :is_active
      t.integer :parent_id
      t.string :structure
      t.string :organization
      t.string :industry
      t.string :logo

      t.timestamps
    end
  end
end
