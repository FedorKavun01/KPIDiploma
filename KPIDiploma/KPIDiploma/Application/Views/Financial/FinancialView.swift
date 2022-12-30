//
//  FinancialView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 03.12.2022.
//

import SwiftUI

struct FinancialView: View {
    @StateObject private var viewModel: FinanceViewModel = .init()
    
    var body: some View {
        VStack {
            Image(viewModel.status.imageName)
                .resizable()
                .frame(width: 250, height: 250)
                .padding(.bottom, 30)
            
            Text(viewModel.status.title)
                .font(.system(size: 25, weight: .semibold))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.getFinanceData()
        }
    }
}

struct FinancialView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialView()
    }
}
