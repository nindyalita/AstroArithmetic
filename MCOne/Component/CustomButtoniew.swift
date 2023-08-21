//
//  CustomButtomView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 17/08/23.
//

import SwiftUI

struct CustomButtonView: View {
    
     var imageButtonName: String
     var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(imageButtonName)
                    .resizable()
                    .frame(width: 37, height: 41)
                    .padding(.vertical, 10)
            }
        }
    }
}

