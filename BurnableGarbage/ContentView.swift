//
//  ContentView.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/19.
//

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
