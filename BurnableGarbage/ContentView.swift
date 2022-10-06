//
//  ContentView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/19.
//
//　2回目アイウエオ

import SwiftUI

//let maxWidth = UIScreen.main.bounds.width
//let maxHeight = UIScreen.main.bounds.height

//基本的に使ってはいけない。マルチ画面。使う場面なし。
//代入された瞬間を保持
//toplevelに飽きてあるため。いれこ関係で最上位。一般的にはなし。
//冷蔵庫理論。誰にでも書き換えられてしまうため。
//privateを使うとどこでミスしているかわかりやすくなる。
//let maxHeight = UIScreen.main.bounds.height←だめ。

struct ContentView: View {
 
    @State var HomeOn = true
    @State var ButtonGarbageOn = false
    @State var SwipViewOn = false
  
    var body: some View {
        
        GeometryReader { geometry in
            if HomeOn{
                
                ZStack{
                    Home()
                
                    VStack{
                        Color.clear
                            .frame(height: geometry.size.height * 0.8)
    
                        HStack{
                            Spacer()
                            Button(action: {
                        ButtonGarbageOn = true
                        HomeOn = false
                        SwipViewOn = false

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
                        Spacer()
//                            minLength: 30)
                    }
                }
                
            }
            
            if ButtonGarbageOn{
                TouchGarbage(
                    ButtonGarbageOn: $ButtonGarbageOn,
                    HomeOn: $HomeOn
                )
            }
            
            if SwipViewOn{
                SwipGarbageVer2(
                    SwipViewOn: $SwipViewOn,
                    HomeOn: $HomeOn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
