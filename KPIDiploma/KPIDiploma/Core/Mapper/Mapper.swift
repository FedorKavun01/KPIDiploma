//
//  Mapper.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation

class Mapper {
    func mapLessonDTO(dto: LessonDTO) -> Lesson {
        return .init(id: dto.id,
                     groupId: dto.groupID,
                     name: dto.name,
                     startTime: dto.startTime.stringToDate() ?? .init(),
                     endTime: dto.endTime.stringToDate() ?? .init(),
                     teacher: dto.teacher,
                     link: dto.link,
                     theme: dto.theme,
                     homework: dto.homework)
    }
    
    func mapScheduleDayDTO(dto: ScheduleDayDTO) -> ScheduleDay {
        let lessons = dto.lessons.map { mapLessonDTO(dto: $0) }
        
        return .init(id: dto.id,
                     date: dto.date.stringToDate() ?? .init(),
                     lessons: lessons)
    }
    
    func mapUserDTO(dto: UserDTO) -> User {
        return .init(id: dto.id,
                     groupId: dto.groupID,
                     firstName: dto.firstName,
                     lastName: dto.lastName)
    }
    
    func mapGroupDTO(dto: GroupDTO) -> Group {
        return .init(id: dto.id,
                     name: dto.name,
                     curatorName: dto.curatorName)
    }
    
    func mapMarkDTO(dto: MarkDTO) -> Mark {
        return .init(id: dto.id,
                     studentId: dto.studentId,
                     name: dto.name,
                     mark: dto.mark,
                     teacher: dto.teacher)
    }
    
    func mapExamDTO(dto: ExamDTO) -> Exam {
        return .init(id: dto.id,
                     groupId: dto.groupID,
                     name: dto.name,
                     startTime: dto.startTime.stringToDate() ?? .init(),
                     endTime: dto.endTime.stringToDate() ?? .init(),
                     teacher: dto.teacher)
    }
    
    func mapFinanceDTO(dto: FinanceDTO) -> Finance {
        return .init(id: dto.id,
                     studentId: dto.studentID,
                     isContract: dto.isContract)
    }
    
    func mapSignInEntity(model: SignInEntity) -> SignInEntityDTO {
        return .init(login: model.login,
                     password: model.password)
    }
}
