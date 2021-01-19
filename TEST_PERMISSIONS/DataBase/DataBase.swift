//
//  DataBase.swift
//  TEST_PERMISSIONS
//
//  Created by md760 on 19.01.2021.
//

import Foundation

create_table "permissions", force: :cascade, options: DEFAULT, in t
    t.string   "action"
    t.boolean  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action", "value"], name: "index_permissions_on_action_and_value", unique: true, using: :btree
    t.index ["action"], name: "index_permissions_on_action", using: :btree
  end

  create_table "permissions_roles", force: :cascade, options: DEFAULT, in t
    t.integer "role_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id", using: :btree
    t.index ["role_id"], name: "index_permissions_roles_on_role_id", using: :btree
  end

  create_table "permissions_users", force: :cascade, options: DEFAULT in t
    t.integer "user_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_permissions_users_on_permission_id", using: :btree
    t.index ["user_id"], name: "index_permissions_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: DEFAULT in t
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "users_roles", force: :cascade, options: DEFAULT in t
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
