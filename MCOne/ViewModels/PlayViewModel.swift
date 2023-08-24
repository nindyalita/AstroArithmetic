//
//  PlayViewModel.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import Foundation

class PlayViewModel: ObservableObject{
    
    @Published var question: [[Number]] = []
    @Published var isShowFalseAlert: Bool = false
    @Published var isShowCorrectAlert: Bool = false
    @Published var sumCorrectAns: [String] = []
    @Published var isGameFinished: Bool = false
    @Published var confirmReplayGame: Bool = false
    @Published var imageName: String = "helmet3"
    @Published var isOpenGuidance: Bool = true
    
    init(){
        imageName = randomImageName()
    }
    
    func randomImageName() -> String {
        let imageNames = ["helmet3", "Astronout","Glove", "Shoes", "Suit"]
        let imageName = imageNames.randomElement() ?? "helmet3"
        return imageName
    }
    
    func generateRandomNum(){
        var randomNumber : [[Number]] = []
        
        for _ in 0..<4 {
            var arrNumTemp: [Number] = []
            for _ in 0..<4{
                let tempNum1 = Int.random(in: 1..<10)
                let tempNum2 = Int.random(in: 1..<10)
                let resTemp = tempNum1 + tempNum2
                let tempData = Number(operand1: tempNum1, operand2: tempNum2, result: resTemp)
                arrNumTemp.append(tempData)
            }
            randomNumber.append(arrNumTemp)
            arrNumTemp.removeAll()
        }
        question = randomNumber
        print(question)
    }

    func hideAlert (timer: Int) async{
        try? await Task.sleep(for: .seconds(timer))
        DispatchQueue.main.async {
            self.isShowFalseAlert=false
            self.isShowCorrectAlert=false
        }
    }
}
