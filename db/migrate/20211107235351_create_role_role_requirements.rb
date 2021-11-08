class CreateRoleRoleRequirements < ActiveRecord::Migration[6.1]
  def change
    create_table :role_role_requirements do |t|
      t.belongs_to :role, null: false, foreign_key: true
      t.belongs_to :role_requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
