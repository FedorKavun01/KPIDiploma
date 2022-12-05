//
//  SignInViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 05.12.2022.
//

import Foundation
import Combine

class SignInViewModel: BaseViewModel {
    @Published var login: String = ""
    @Published var password: String = ""
    private var repository: Repository = RepositoryImpl()
    private var cancellables: Set<AnyCancellable> = .init()
    
    func signIn() {
        self.shouldShowLoader = true
        repository.signIn(login: login, password: password)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    print("\(#function) succesful")
                case .failure(let error):
                    print("\(#function) \(error.localizedDescription)")
                }
                self.shouldShowLoader = false
            } receiveValue: { response in
                UserDefaults.set(StorageKey.currentUserId, to: response.id)
                UserDefaults.set(StorageKey.currentGroupId, to: response.groupId)
            }
            .store(in: &cancellables)
    }
}
