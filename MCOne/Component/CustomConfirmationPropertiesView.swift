//
//  CustomConfirmationPropertiesView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 17/08/23.
//

import SwiftUI

struct CustomConfirmationPropertiesView: View {
    var imageButtonName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(imageButtonName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
        }
    }
}

