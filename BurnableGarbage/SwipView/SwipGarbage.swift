//
//  SwipGarbage.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/27.
//
import SwiftUI
import AVFoundation


struct SwipGarbage: View {
    //    @Binding var SwipViewOn: Bool
    //    @Binding var HomeOn: Bool
    
    //    @State private var plastic = false
    //    @State private var kamikuzu = false
    //    @State private var nuigurumi = false
    //    @State private var shoes = false
    //    @State private var notebook = false
    //    @State private var kutsushita = false
    
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    @State var itemkind = ["M","M","P","M","M"]
    
    @State var transration: CGSize = .zero
    
    
    @State var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y:UIScreen.main.bounds.height / 2)
    
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
      
    
    
//問題点imageの中でGifが出ちゃってる。
    
    var body: some View {
        
            ZStack {
                
                BackView()
// 問題画像の表示
                 Image(items[bangou])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
//                    .background()
                    .position(location)
                    .gesture(dragGesture)
                
//                ForEach(items, id: \.self)  { num in
//                        Image(num)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 400, height: 400)
//                        .background(Color.white)
//                        .offset(self.items.last == num ? transration : .zero)
//                        .gesture(
//                            DragGesture()
//                                .onChanged({ value in
//                                    self.transration = value.translation
//                                    print("value: ", value.location)
//                                })
//                                .onEnded({ value in
//                                    if value.startLocation.y - 150 > value.location.y {
//                                        self.transration = .init(width: 0  , height: -800)
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                            self.items.removeLast()
//
//                                                withAnimation() {
//                                                    self.shoes.toggle()
//                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                                        if shoes == false{
//                                                                playSoundCorrect()
//
//                                                        }
//                                                    }
//                                                }
//
//                                            withAnimation() {
//                                                self.kutsushita.toggle()
//                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                                    if kutsushita == false{
//                                                        playSoundWrong()
//
//                                                    }
//                                                }
//                                            }
//
//                                            self.transration = .zero
//                                        }
//                                    } else if value.startLocation.y + 150 < value.location.y {
//                                        self.transration = .init(width: 0  , height: +800)
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                            self.items.removeLast()
//                                            withAnimation() {
//                                                self.shoes.toggle()
//                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                                    if shoes == false{
//                                                        playSoundWrong()
//
//                                                    }
//                                                }
//                                            }
//                                            self.transration = .zero
//                                        }
//                                    } else {
//                                        self.transration = .zero
//                                    }
//                                })
//                        )
//                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
//
//
//                    if shoes == false {
//                        ZStack {
//                            SplashSuccessScreen()
//                                .frame(width: 200, height: 200)
//                                .scaleEffect(shoes ? 2.0 : 2.0)
//                                .animation(
//                                    .default.delay(0.2))
//                        }
//                    }
//
       //
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


struct SwipGarbage_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbage()
    }
}
