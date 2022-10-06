//
//  DisabledTest.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/19.
//

import SwiftUI
//isHiddenを使って、ボタンを押せなくするためのtestView
//解決したい課題：元あったスペースを確保して、画像を移動させて消したい。（実演）
//.isHidden問題：消えるがtransitionでレイアウトがずれる
//ロジック問題：動作の仕組みを考えてコード化する。箱の中にImageを入れてずれないようにする。
//現在よりも良い書き方があるのか
struct DisabledTest: View {
    
    @State var nuigurumi = false
    @State var shoes = false
    @State var kamikuzu = false
    
    @State var counter = 0
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    withAnimation() {
                        nuigurumi = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            if nuigurumi {
                                playSoundWrong()
                            }
                        }
                    }
                } label: {
                    if !nuigurumi {
                        Image("nuigurumi")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .background(Color.black)
                        //  .opacity(f3 ? 0 : 1)
                        //  .background(Color.black)
                            .transition(.offset(x: 350, y: 800))
                    }
                }.isHidden(isShow: nuigurumi)
//予測：trasitionで、ぬいぐるみの空間がそのまま消えてしまうため、VStackで囲まれたゴミ袋が上に上がってくる（もしくはHStackの空間縮まって隣のImageの位置がずれてしまう）。ishiddenがtrueになることですぐにぬいぐるみが消えてしまいtransitionが効いてないように見えてしまう。
//したかったこと：isHiddenを使ってHStackの中から消えた後も、元々あったスペースを確保して縮まらないようにすることと、Buttonを押せないようにしたかった。

                
                
                VStack{
                    Button {
                            withAnimation() {
                                shoes = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if shoes {
                                        playSoundWrong()
                                    }
                                }
                            }

                    }label: {
                        if !shoes {
                            Image("shoes")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .background(Color.black)
                                .transition(AnyTransition.offset(x: 350, y: 800))
                        }
                    }
                }.frame(height:200)
                ZStack{
                    Color.black
                    Button {
                        withAnimation() {
                            kamikuzu = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if kamikuzu {
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if !kamikuzu {
                            Image("kamikuzu")
                                .resizable()
                                .scaledToFit()
                                .transition(AnyTransition.offset(x: 350, y: 800))
                        }
                    }
                }.frame(width: 200, height: 200)
                
            }
                
                
                ZStack {
                    
                    Image("gomibukuro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    if shoes {
                        SwipGarbegeEndMove()
                            .frame(width: 200, height: 200)
                            .scaleEffect(2.0)
                            .animation(
                                .default.delay(0.2))
                    }
                    
                    if nuigurumi {
                        SwipGarbegeEndMove()
                            .frame(width: 200, height: 200)
                            .scaleEffect(2.0)
                            .animation(
                                .default.delay(0.2))
                    }
                    
                    if kamikuzu {
                        SwipGarbegeEndMove()
                            .frame(width: 200, height: 200)
                            .scaleEffect(2.0)
                            .animation(
                                .default.delay(0.2))
                    }
                }
            }
        }//body
    
    }//struct

struct DisabledTest_Previews: PreviewProvider {
    static var previews: some View {
        DisabledTest()
    }
}
