//
//  GeometryViewTest.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/30.
//

import SwiftUI

struct GeometryViewTest: View {

  
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    @State var itemkind = ["M","M","P","M","M"]
    @State var offset: CGSize = CGSize(width: 0, height: 0)
    @State var bangou: Int = 4
    
    @State var batsuFlag:Bool = false
    @State var seikaiFlag:Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            
            let dragGesture = DragGesture()
               
                    .onChanged { value in
                        offset = value.translation
                        
                    }
                    .onEnded{_ in
                        if  offset.height >  0  && itemkind[bangou] == "P" ||
                                offset.height < 0  && itemkind[bangou] == "M"{
                            playSoundCorrect()
                            seikaiFlag = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                seikaiFlag = false
                                bangou -= 1
                                offset = CGSize(width: 0,height: 0)
                            }
                        }else {
                            playSoundWrong()
                            batsuFlag = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                batsuFlag = false
                                bangou -= 1
                                offset = CGSize(width: 0,height: 0)
                            }
                        }
                        if bangou > 0 {
                            
                        } else{
                            print("終わり")
                        }
                    }
            
            
            ZStack {
                BackView()
                
                Image(items[bangou])
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
//                        .offset(offset)
                    .position(x: geometry.size.width / 2 + offset.width, y: geometry.size.height / 2 + offset.height)
                    .gesture(dragGesture)
                

                       
                //代入する。？言葉の意味 splashfag にfalseを代入
                if batsuFlag {
                    Image("batsu")
                }
                if seikaiFlag {
                    Image("maru")
                }
                
            }//ZStackの閉じ
        }
    }//viewの閉じ
}//swipGarbageの閉じ

struct GeometryViewTest_Previews: PreviewProvider {
    static var previews: some View {
        GeometryViewTest()
    }
}
