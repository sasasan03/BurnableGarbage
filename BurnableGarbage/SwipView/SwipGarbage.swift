//
//  SwipGarbage.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/27.
//
import SwiftUI
import AVFoundation

//上のボタン配置について。どのような機種であっても適応されるのか？geometryReaderを使っている。
//UIScreenを使わずに真ん中配置を可能にすることはできるのか？UIscreenの使いどころ
//アイテムをからになったあとの初期化処理
//Spacer(minLength: UIScreen.main.bounds.size.width * 0.8)の使い方
struct SwipGarbage: View {
    
    @Binding var SwipViewOn: Bool
    @Binding var HomeOn: Bool
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    @State var itemkind = ["M","M","P","M","M"]
    
    @State var transration: CGSize = .zero
    //UIScreenで少し左に寄ってる
    @State var location: CGPoint = CGPoint(x:  maxWidth / 2, y: maxHeight / 2)
    
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
        location = CGPoint(x: maxWidth / 2, y: maxHeight / 2)
    }
      
    
    var body: some View {
        
            ZStack {
                
                BackView()
// 問題画像の表示（少し左に寄ってる）
                 Image(items[bangou])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .background(Color.black)
                // .background()
                    .position(location)
                    .gesture(dragGesture)
                
                VStack{
                    GeometryReader { geometry in
                        HStack(spacing: 0){

                            Button() {
                                self.SwipViewOn = false
                                self.HomeOn = true
                            } label: {
                                Text("やめる")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.red)
                                    .background(Color.blue)
//                                    .fontWeight(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(1.0)
//paddingで位置調整を行った
                                    .padding(.trailing, 180)
                            }.frame(width: geometry.size.width / 2)
                                .background(Color.green)
                            
                            Button {
                                self.SwipViewOn = false
                                self.HomeOn = true
                            } label: {
                                Text("やりなおす")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.blue)
                                    .background(Color.orange)
//                                    .fontWeight(.black)
                                    .lineLimit(1)
                                    .minimumScaleFactor(1.0)
//paddingで位置調整を行った
                                    .padding(.leading, 180)
                            }.frame(width: geometry.size.width / 2)
                                .background(Color.indigo)
                        }
                    }
                    
                    
                    Spacer()
                }


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

struct SwipGarbage_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbage(SwipViewOn: .constant(false), HomeOn: .constant(false))
    }
}
