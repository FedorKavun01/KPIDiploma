//
//  ContentView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 06.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
    //            SignInView()
                HomeView()
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
