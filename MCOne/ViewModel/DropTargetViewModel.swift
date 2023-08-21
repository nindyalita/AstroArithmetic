//
//  DropTargetViewModel.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import Foundation
import SwiftUI

struct DTDropTarget: DropDelegate {
    var num1: Int
    var num2: Int

    var onComplete: ((Bool) -> ())
    
    func performDrop(info: DropInfo) -> Bool {
        print(num1, num2)
        let provider = info.itemProviders(for: [.text]).first

        provider?.loadTransferable(type: String.self) { result in
            switch result {
            case .success(let string):
                Task {
                    await onComplete(await num1 + num2 == Int(string)!)
                }
                print("Result:", string)
            case .failure(let error):
                print(error)
            }
        }

        return true
    }

    func dropEntered(info: DropInfo) {
        print(info)
    }
}
