//
//  BaseViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 28.11.2022.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    @Published var shouldShowLoader: Bool = false
    @Published var shouldShowErrorAlert: Bool = false
}
