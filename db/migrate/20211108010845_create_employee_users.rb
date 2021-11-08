class CreateEmployeeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_users do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
