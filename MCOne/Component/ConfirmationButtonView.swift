//
//  ConfirmationButtonView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 17/08/23.
//

import SwiftUI

struct ConfirmationButtonView: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.5)
    }
}
