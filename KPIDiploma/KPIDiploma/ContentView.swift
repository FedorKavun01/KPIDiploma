//
//  ContentView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 06.11.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    private var userId: String {
        UserDefaults.get(StorageKey.currentUserId)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if userId.isEmpty {
                    SignInView()
                } else {
                    HomeView()
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
