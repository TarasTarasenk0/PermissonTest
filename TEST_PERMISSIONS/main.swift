//
//  main.swift
//  TEST_PERMISSIONS
//
//  Created by md760 on 18.01.2021.
//

import Foundation
Func is_action_permitted {
    permission = @entity.permissions.find_by(action: permission_params[:action])
    if permission.present?
      render json: permission, status: 200
    else
      render json: permission, status: 404
}

Func create {
    hash = format_hash
    permission = Permission.grant_permission(hash, @entity)
    if permission.present?
      render json: permission, status: 201
    else
      render json: { errors: ["#{@entity.class.name} already has this permission."] }, status: 422
}

Func check_entity_type {
    head 400 unless %w[Role User].include? entity_params[:type]
}

Func set_entity {
    @entity = entity_params[:type].find_by_id(entity_params[:id])
    head 404 unless @entity.present?
}

Func permission_params {
    params.require(:permission).permit(:action, :value)
 }

  func entity_params() {
    params.require(:entity).permit(:id, :type)
}

