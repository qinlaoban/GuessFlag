//
//  ContentView.swift
//  GuessFlag
//
//  Created by Qin on 2020/1/14.
//  Copyright © 2020 Qin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["中国", "日本", "法国", "德国", "意大利", "俄罗斯", "英国", "美国"]
    @State private var currentCountry = Int.random(in: 0...2)
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [.green, .blue]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                VStack(spacing: 10){
                    Text("以下国家的旗帜是哪一个")
                        .foregroundColor(.white)
                    Text(countries[currentCountry])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3, id: \.self){ num in
                    Button(action: {
                        self.alertTitle = num == self.currentCountry ? "答对" : "答错"
                        self.showAlert = true
                    }) {
                        Image(self.countries[num])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                    }
                    
                }
                Spacer()
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(self.alertTitle),
                message: nil,
                dismissButton: .default(Text("继续")){
                    self.next()
                }
            )
        }

    }
    
    func next(){
        countries.shuffle()
        currentCountry = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
