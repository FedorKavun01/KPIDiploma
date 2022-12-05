//
//  Group.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation

struct Group {
    public var id: String
    public var name: String
    public var curatorName: String
    
    static let mockData: Self = .init(id: "", name: "", curatorName: "")
}
