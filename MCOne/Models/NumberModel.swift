//
//  GenerateNumber.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import Foundation

struct Number: Hashable {
    var id: String = UUID().uuidString
    var num1: Int
    var num2: Int
    var resAdd: Int
    var isCorrect: Bool = false
}
