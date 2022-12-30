//
//  InfoViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import Foundation
import Combine

class InfoViewModel: BaseViewModel {
    @Published var user: User?
    private var repository: Repository = RepositoryImpl()
    private var cancellables: Set<AnyCancellable> = .init()
    
    private var userId: String {
        UserDefaults.get(StorageKey.currentUserId)
    }
    
    func getUser() {
        self.shouldShowLoader = true
        
        repository.getUser(userId: "57b1a4c9-80e0-4a39-9b45-68c014195e2e")
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
                print(response)
                self.user = response
            }
            .store(in: &cancellables)
    }
}
