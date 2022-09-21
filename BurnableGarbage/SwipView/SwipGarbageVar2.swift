//
//  SwipGarbageVar2.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/18.
//

import SwiftUI

struct SwipGarbageVar2: View {
        
        @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
        @State var itemkind = ["M","M","P","M","M"]
        
        @State var transration: CGSize = .zero
        
        @State var location: CGPoint = CGPoint(x:  UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        
        @State var bangou: Int = 4
        
        @State var batsuFlag:Bool = false
        @State var seikaiFlag:Bool = false
        
        //gestureブロック some Gestureとは
        var dragGesture: some Gesture {
            DragGesture()
                .onChanged { value in
                    location = value.location
                    
                }
                .onEnded{_ in
                    hantei()
                    if bangou > 0 {
                        
                    } else{
                        saigo()
                    }
                }
        }
        //最後のゴミが消えた後の動きを入力
        func saigo() {
            print("終わり")
        }
        
        //判定
        func hantei(){
            if location.y > 400 && itemkind[bangou] == "P" ||
                location.y < 400  && itemkind[bangou] == "M"{
                playSoundCorrect()
                seikaiFlag = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    seikaiFlag = false
                    syokika()
                }
            }else {
                playSoundWrong()
    //            SplashErrorScreen()
                batsuFlag = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    batsuFlag = false
                    syokika()
                }
            }
        }
        
        func syokika() {
            bangou -= 1
            location = CGPoint(x: UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height / 2)
        }
          
        
        var body: some View {
            
                ZStack {
                    
                    BackView()
                    
                  
                   
        
                        Image(items[bangou])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .background()
                            .position(location)
                            .gesture(dragGesture)
                                                          
                   //代入する。？言葉の意味 splashfag にfalseを代入
                    if batsuFlag {
                        Image("batsu")
                    }
                    if seikaiFlag {
                        Image("maru")
                    }
                
                    }//ZStackの閉じ
                }//viewの閉じ
        }//swipGarbageの閉じ

struct SwipGarbageVar2_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbageVar2()
    }
}
