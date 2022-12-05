//
//  RepositoryImpl.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation
import Alamofire
import Combine

class RepositoryImpl: Repository {
    private let dataProvider: DataProviderProtocol = DataProvider()
    private let mapper: Mapper = Mapper()
    
    func signIn(login: String, password: String) -> AnyPublisher<User, Alamofire.AFError> {
        dataProvider.signIn(login: login, password: password)
            .map {
                self.mapper.mapUserDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getUser(userId: String) -> AnyPublisher<User, Alamofire.AFError> {
        dataProvider.getUser(userId: userId)
            .map {
                self.mapper.mapUserDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getGroup(groupId: String) -> AnyPublisher<Group, Alamofire.AFError> {
        dataProvider.getGroup(groupId: groupId)
            .map {
                self.mapper.mapGroupDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getMarks(userId: String) -> AnyPublisher<[Mark], Alamofire.AFError> {
        dataProvider.getMarks(userId: userId)
            .map { dto in
                dto.map {
                    self.mapper.mapMarkDTO(dto: $0)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getExams(userId: String) -> AnyPublisher<[Exam], Alamofire.AFError> {
        dataProvider.getExams(userId: userId)
            .map { dto in
                dto.map {
                    self.mapper.mapExamDTO(dto: $0)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func getFinanceData(userId: String) -> AnyPublisher<Finance, Alamofire.AFError> {
        dataProvider.getFinanceData(userId: userId)
            .map {
                self.mapper.mapFinanceDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getLesson(lessonId: String) -> AnyPublisher<Lesson, Alamofire.AFError> {
        dataProvider.getLesson(lessonId: lessonId)
            .map {
                self.mapper.mapLessonDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getCurrentLesson(groupId: String) -> AnyPublisher<Lesson, Alamofire.AFError> {
        dataProvider.getCurrentLesson(groupId: groupId)
            .map {
                self.mapper.mapLessonDTO(dto: $0)
            }
            .eraseToAnyPublisher()
    }
    
    func getLessons(groupId: String) -> AnyPublisher<[ScheduleDay], Alamofire.AFError> {
        dataProvider.getLessons(groupId: groupId)
            .map { dto in
                dto.map {
                    self.mapper.mapScheduleDayDTO(dto: $0)
                }
            }
            .eraseToAnyPublisher()
    }
}
