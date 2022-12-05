//
//  UserDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct UserDTO: Codable {
    public var id: String
    public var groupId: String
    public var firstName: String
    public var lastName: String
}
