//
//  DieView.swift
//  Yahtzee
//
//  Created by Arvid Axelsson on 2022-11-28.
//

import SwiftUI

struct DieView: View {
    
    @ObservedObject var model: DieModel
    
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "die.face.\(model.value)")
                .font(.system(size: 50))
        }
        .foregroundColor(model.isActive ? .black : .gray)
    }
}

struct DieView_Previews: PreviewProvider {
    static var previews: some View {
        DieView(model: DieModel())
    }
}
