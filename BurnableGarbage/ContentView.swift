//
//  ContentView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/19.
//
//　2回目アイウエオ

import SwiftUI

//struct外に変数を立てる書き方は問題ないのか？なぜ他のViewに反映されるのか？
let maxWidth = UIScreen.main.bounds.width
let maxHeight = UIScreen.main.bounds.height

struct ContentView: View {

    
    @State var HomeOn = true
    @State var ButtonGarbageOn = false
    @State var SwipViewOn = false
    
   
    
    var body: some View {
        
//        SwipGarbage()
//        NavigationView {
//
//            VStack {
//                NavigationLink {
//                    TouchGarbage()
//                } label: {
//                    Text("タッチ①")
//                }
//                .padding()
//
//                NavigationLink {
//                    SwipGarbage()
//                } label: {
//                    Text("スワイプ②")
//                }
//            }
//            .navigationTitle("メニュー")
//            Home()
//        }
        
        
        
        if HomeOn{
            
            ZStack{
                Home()
            
                VStack{
                    Spacer(minLength: UIScreen.main.bounds.size.height * 0.8)
                    HStack{
                        Spacer(minLength: 160)
                        Button(action: {
                    ButtonGarbageOn = true
                    HomeOn = false
                    SwipViewOn = false
//                            displayMode = .second
                        }) {
                            HStack{
                                Image(systemName: "hand.tap")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    
                                Text("ボタンで！")
                                    .font(.system(size: 30))
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                        Spacer()
                        Button(action: {
                    SwipViewOn = true
                    HomeOn = false
                    ButtonGarbageOn = false
//                            displayMode = .third
                        }) {
                            HStack{
                                Image(systemName: "hand.draw")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("スワイプで！")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.blue)
                                
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                        Spacer()//minLength: 30)
                    }
                    Spacer(minLength: 30)
                }
            }
            
        }
            
//        } else if displayMode == display.second {
//            TouchGarbage(displayMode2: $displayMode)
//        } else if displayMode == display.third {
//            SwipGarbage()
//        }
        
        if ButtonGarbageOn{
            TouchGarbage(
                ButtonGarbageOn: $ButtonGarbageOn,
                HomeOn: $HomeOn
            )
        }
        
        if SwipViewOn{
            SwipGarbage(
                SwipViewOn: $SwipViewOn,
                HomeOn: $HomeOn)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
