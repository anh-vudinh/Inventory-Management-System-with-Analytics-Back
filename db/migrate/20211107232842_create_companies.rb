class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :description
      t.boolean :is_parent
      t.integer :parent_id
      t.string :company_structure
      t.string :company_type
      t.string :company_model

      t.timestamps
    end
  end
end
