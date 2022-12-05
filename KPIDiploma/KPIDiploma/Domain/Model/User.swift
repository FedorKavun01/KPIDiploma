//
//  User.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct User {
    public var id: String
    public var groupId: String
    public var firstName: String
    public var lastName: String
    
    static let mockData: Self = .init(id: "", groupId: "", firstName: "", lastName: "")
}
