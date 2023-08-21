//
//  AnswerView.swift
//  MCOne
//
//  Created by Nindya Alita Rosalia on 16/08/23.
//

import SwiftUI

struct AnswerView: View {
    var question : [[Number]]
    
    var body: some View{
        HStack{
            ForEach(Array(question.enumerated()), id: \.offset){i, que in
                VStack{
                    ForEach(Array(que.enumerated().shuffled()), id: \.offset){x, num in
                        HStack{
                            Text("\(question[i][x].resAdd)")
                                .frame(width: 75, height: 35)
                                .foregroundColor(Color(.white))
                                .background(
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .stroke(Color("PurpleLight"), lineWidth: 3)
                                )
                                .background(Color("PurpleDark"))
                                .padding(2)
                                .font(.system(size: 20).bold())
                                .onDrag({
                                    NSItemProvider(object: String(question[i][x].resAdd) as NSString)
                                })
                        }
                        .opacity(num.isCorrect == true ? 0 : 1)
                    }
                }
            }
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(question: [
            [
                Number(num1: 2, num2: 3, resAdd: 5),
                Number(num1: 4, num2: 7, resAdd: 11),
                // Add more Number objects here...
            ]
        ])
    }
}
