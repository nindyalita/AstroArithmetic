//
//  AlertView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 17/08/23.
//

import SwiftUI

struct AlertView: View {
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Text(text)
            .frame(alignment: .bottom)
            .padding(10)
            .background(backgroundColor)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
            )
            .foregroundColor(foregroundColor)
            .font(.headline)
            .position(x:370, y:35)
    }
}
