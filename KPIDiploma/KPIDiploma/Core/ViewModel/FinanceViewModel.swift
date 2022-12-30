//
//  FinanceViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import Foundation
import Combine

class FinanceViewModel: BaseViewModel {
    @Published var finance: Finance?
    @Published var status: FinanceStatus = .contractPaid
    private var repository: Repository = RepositoryImpl()
    private var cancellables: Set<AnyCancellable> = .init()
    
    private var userId: String {
        UserDefaults.get(StorageKey.currentUserId)
    }
    
    func getFinanceData() {
        self.shouldShowLoader = true
        
        repository.getFinanceData(userId: userId)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    print("\(#function) succesful")
                case .failure(let error):
                    print("\(#function) \(error.localizedDescription)")
                }
                self.shouldShowLoader = false
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.finance = response
                self.status = response.isContract ? (response.debtAmount ?? 0) > 0 ? .contractDebt("\(response.debtAmount)") : .contractPaid : .budget
            }
            .store(in: &cancellables)
    }
}

enum FinanceStatus {
    case budget
    case contractPaid
    case contractDebt(String)
    case none
    
    var title: String {
        switch self {
        case .budget:
            return "You not on contract, just chill and wait for STIPUKHA"
        case .contractPaid:
            return "Nothing to pay"
        case .contractDebt(let amount):
            return "You must pay \(amount)"
        case .none:
            return "No data"
        }
    }
    
    var imageName: String {
        switch self {
        case .budget:
            return Images.chilling
        case .contractPaid:
            return Images.money
        case .contractDebt(_):
            return Images.chilling
        case .none:
            return Images.noData
        }
    }
}
