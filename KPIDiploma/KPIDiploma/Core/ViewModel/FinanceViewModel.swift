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
            }
            .store(in: &cancellables)
    }
}
