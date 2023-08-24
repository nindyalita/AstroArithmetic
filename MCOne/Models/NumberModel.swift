//
//  GenerateNumber.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import Foundation

struct Number: Hashable {
    var id: String = UUID().uuidString
    var operand1: Int
    var operand2: Int
    var result: Int
    var isCorrect: Bool = false
}
