//
//  QuestionView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question : [[Number]]
    @Binding var isShowAlert: Bool
    @Binding var sumCorrectAns: [String]
    @Binding var isGameFinished: Bool
    @Binding var isShowCorrectAlert: Bool
    
    func handleDrop(succeed: Bool, row: Int, col: Int){
        DispatchQueue.main.async {
            if succeed{
                isShowCorrectAlert = true
                question[row][col].isCorrect = true
                sumCorrectAns.append( question[row][col].id)
                print("liat sini",sumCorrectAns.count, question.count)
                
                if(sumCorrectAns.count == 16){
                    print("Game selesai")
                    isGameFinished=true
                }
            }else{
                isShowAlert=true
            }
        }
    }
    
    var body: some View{
        HStack{
            ForEach(Array(question.enumerated()), id: \.offset){row, que in
                VStack{
                    ForEach(Array(que.enumerated()), id: \.offset){col, num in
                        HStack{
                            Text("\(question[row][col].num1) + \(question[row][col].num2)")
                                .frame(width: 88, height: 52)
                                .foregroundColor(Color(.white))
                                .background(
                                    Rectangle()
                                        .stroke(Color("BlueLight"), lineWidth: 1)
                                )
                                .background(Color("PurpleLight"))
                                .padding(.horizontal, 3)
                                .font(.system(size: 14).bold())
                                .onDrop(of: ["text"], delegate: DTDropTarget(num1: question[row][col].num1, num2: question[row][col].num2) { succeed in
                                    handleDrop(succeed: succeed, row: row, col: col)
                                })
                        }
                        .padding(-7)
                        .opacity(num.isCorrect == true ? 0 : 1)
                    }
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            question: .constant([]),
            isShowAlert: .constant(false),
            sumCorrectAns: .constant([]),
            isGameFinished: .constant(false),
            isShowCorrectAlert: .constant(false)
        )
    }
}
