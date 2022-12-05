//
//  ScheduleViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import Foundation
import Combine

class ScheduleViewModel: BaseViewModel {
    @Published var scheduleDays: [ScheduleDay] = []
    private var repository: Repository = RepositoryImpl()
    private var cancellables: Set<AnyCancellable> = .init()
    
    private var groupId: String {
        UserDefaults.get(StorageKey.currentGroupId)
    }
    
    func getSchedule() {
        self.shouldShowLoader = true
        
        repository.getLessons(groupId: groupId)
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
                self.scheduleDays = response
            }
            .store(in: &cancellables)
    }
}
