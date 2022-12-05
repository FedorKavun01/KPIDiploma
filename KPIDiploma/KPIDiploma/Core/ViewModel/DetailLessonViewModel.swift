//
//  DetailLessonViewModel.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import Foundation
import Combine

class DetailLessonViewModel: BaseViewModel {
    @Published var lesson: Lesson?
    private var repository: Repository = RepositoryImpl()
    private var cancellables: Set<AnyCancellable> = .init()
    private var lessonId: String
    
    init(lessonId: String) {
        self.lessonId = lessonId
    }
    
    func getLesson() {
        self.shouldShowLoader = true
        repository.getLesson(lessonId: lessonId).sink { [weak self] completion in
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
            self.lesson = response
        }
        .store(in: &cancellables)
    }
}
