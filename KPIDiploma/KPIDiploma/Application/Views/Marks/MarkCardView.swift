//
//  MarksCardView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 11.12.2022.
//

import SwiftUI

struct MarkCardView: View {
    let mark: Mark
    
    var body: some View {
        HStack {
            Text(mark.name)
                .font(.system(size: 25))
            
            Spacer()
            
            Text("\(mark.mark)")
                .font(.system(size: 20))
                .foregroundColor(getMarkColor(mark: mark.mark))
        }
        .padding()
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        }
        .shadow(color: Color.gray.opacity(0.08), radius: 32, x: 0, y: 24)
        .shadow(color: Color.gray.opacity(0.08), radius: 16, x: 0, y: 16)
    }
    
    private func getMarkColor(mark: Int) -> Color {
        switch mark {
        case 95...100:
            return Color.green
        case 85...94:
            return Color.mint
        case 75...84:
            return Color.yellow
        case 65...74:
            return Color.orange
        case 60...65:
            return Color.red
        default:
            return Color.black
        }
    }
}

struct MarksCardView_Previews: PreviewProvider {
    static var previews: some View {
        MarkCardView(mark: .init(id: "1",
                                  studentId: "",
                                  name: "Mark1",
                                  mark: 100,
                                  teacher: "Teacher"))
    }
}
