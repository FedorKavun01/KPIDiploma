//
//  StorageKey.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 30.11.2022.
//

import Foundation

open class StorageKey {
    public static var currentUserId = UserDefaults.Key("CurrentUserId", defaultValue: "")
    public static var currentGroupId = UserDefaults.Key("CurrentGroupId", defaultValue: "")
}
