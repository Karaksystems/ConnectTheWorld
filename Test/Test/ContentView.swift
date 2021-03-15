//
//  ContentView.swift
//  Test
//
//  Created by Sibin Lukose on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    @State  var text1:String = "2"
    @State private var text2 = "2"
    @State private var text3 = ""
    var body: some View {
        VStack{
            HStack {
                Text("Hello, world!")
                    .padding()
                
            }
            TextField("0", text: $text1).onChange(of: text3, perform: { value in
                text1 = Minus(firstNumber: text3, secondNumber: text2)
                text2 = Minus(firstNumber: text3, secondNumber: text1)
            })
            TextField("0", text: $text2).onChange(of: text2, perform: { value in
                text3 = Add(firstNumber: text1, secondNumber: text2)
            })
            TextField("0", text: $text3)
                .onChange(of: text1, perform: { newValue in
                text3 = Add(firstNumber: text1, secondNumber: text2)
            })
        }.onAppear(perform: {
            text3 = Add(firstNumber: text1, secondNumber: text2)
        })
        
    }
    func Add(firstNumber:String?, secondNumber:String?) -> String{
        
        let fNumber : Int = Int(firstNumber!) ?? 0
        let sNumber : Int = Int(secondNumber!) ?? 0
        return String( fNumber + sNumber )
    }
    func Minus(firstNumber:String?, secondNumber:String?) -> String{
        
        let fNumber : Int = Int(firstNumber!) ?? 0
        let sNumber : Int = Int(secondNumber!) ?? 0
        return String( fNumber - sNumber )
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
