//
//  CreateUserPermission.swift
//  TEST_PERMISSIONS
//
//  Created by md760 on 19.01.2021.
//

import Foundation

class CreateUsersPermissions {

    create_table :users
      string :username
      string :email
      timestamps
   
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true

    create_table :permissions
      string :action, index: true
      boolean :value
      timestamps
    
    add_index :permissions, %i[action value], unique: true

    create_table :permissioned_users
      integer :user_id, index: true
      integer :permission_id, index: true
}
