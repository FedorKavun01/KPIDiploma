//
//  HomeView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CurrentLessonView()
                .tabItem {
                    Image(Images.navigationCurrentLesson)
                        .padding(.top, 20)
                }
            
            ScheduleView()
                .tabItem {
                    Image(Images.navigationSchedule)
                        .padding(.top, 20)
                }

            ProfileInfoView()
                .tabItem {
                    Image(Images.navigationInfo)
                        .padding(.top, 20)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
