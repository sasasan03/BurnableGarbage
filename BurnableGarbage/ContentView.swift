//
//  ContentView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/19.
//
//　2回目アイウエオ

import SwiftUI

struct ContentView: View {
    
  
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationLink {
                    TouchGarbage()
                } label: {
                    Text("タッチ①")
                }
                .padding()
                
                NavigationLink {
                    SwipGarbage()
                } label: {
                    Text("スワイプ②")
                }
            }
            .navigationTitle("メニュー")
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
