//
//  Role.swift
//  TEST_PERMISSIONS
//
//  Created by md760 on 19.01.2021.
//

import Foundation

class Role {
  include CheckPermission

  validates :name, presence: true, on: :create

  has_and_belongs_to_many :permissions
  belongs_to :user

  Func  can?(action)
    permissions.find_by(action: action).try(:value)
}
