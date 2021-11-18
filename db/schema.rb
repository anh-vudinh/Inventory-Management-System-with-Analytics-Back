# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_08_084345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "extra_info"
    t.date "dob"
    t.string "street_address"
    t.string "zipcode"
    t.string "state"
    t.string "city"
    t.string "age"
    t.string "gender"
    t.string "phone_number"
    t.string "email"
    t.string "citizenship_type"
    t.boolean "is_citizen"
    t.boolean "is_veteran"
    t.boolean "is_felon"
    t.boolean "is_candidate"
    t.boolean "did_interviewed"
    t.datetime "interview_date"
    t.integer "interview_rating"
    t.string "last_employer"
    t.string "employement_status"
    t.string "highest_education"
    t.string "application_method"
    t.integer "application_company"
    t.integer "apply_counter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "established"
    t.string "description"
    t.boolean "is_parent"
    t.boolean "is_active"
    t.integer "parent_id"
    t.string "structure"
    t.string "organization"
    t.string "industry"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_employees", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_employees_on_company_id"
    t.index ["employee_id"], name: "index_company_employees_on_employee_id"
  end

  create_table "company_roles", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_roles_on_company_id"
    t.index ["role_id"], name: "index_company_roles_on_role_id"
  end

  create_table "employee_users", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_users_on_employee_id"
    t.index ["user_id"], name: "index_employee_users_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.date "dob"
    t.string "street_address"
    t.string "zipcode"
    t.string "state"
    t.string "city"
    t.string "age"
    t.string "gender"
    t.string "phone_number"
    t.string "email"
    t.string "emergency_contact_name"
    t.string "emergency_contact_relation"
    t.string "emergency_contact_info"
    t.string "citizenship_type"
    t.boolean "is_citizen"
    t.boolean "is_veteran"
    t.boolean "is_felon"
    t.string "employement_status"
    t.string "highest_education"
    t.datetime "start_hire"
    t.datetime "end_hire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_requirements", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_resources", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_role_requirements", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "role_requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_role_requirements_on_role_id"
    t.index ["role_requirement_id"], name: "index_role_role_requirements_on_role_requirement_id"
  end

  create_table "role_role_resources", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "role_resource_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_role_resources_on_role_id"
    t.index ["role_resource_id"], name: "index_role_role_resources_on_role_resource_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "clearance"
    t.boolean "is_disabled"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_roles_on_company_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "is_disabled"
    t.boolean "step_verify"
    t.string "verify_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "company_employees", "companies"
  add_foreign_key "company_employees", "employees"
  add_foreign_key "company_roles", "companies"
  add_foreign_key "company_roles", "roles"
  add_foreign_key "employee_users", "employees"
  add_foreign_key "employee_users", "users"
  add_foreign_key "role_role_requirements", "role_requirements"
  add_foreign_key "role_role_requirements", "roles"
  add_foreign_key "role_role_resources", "role_resources"
  add_foreign_key "role_role_resources", "roles"
  add_foreign_key "roles", "companies"
end
