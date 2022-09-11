//
//  SwipGarbage.swift
//  BurnableGarbage
//
//  Created by 佐小田弘道 on 2022/08/27.
//

import SwiftUI
import AVFoundation

struct SwipGarbage: View {
    
    @State var items = ["nuigurumi","kamikuzu","plastic","kutsushita","shoes"]
    @State var transration: CGSize = .zero
    @State private var plastic = true
    @State private var kamikuzu = true
    @State private var nuigurumi = true
    @State private var shoes = true
    @State private var notebook = true
    @State private var kutsushita = true

    private let Correct = try! AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)
    private let Wrong = try! AVAudioPlayer(data: NSDataAsset(name: "wrong")!.data)

    private func playSoundCorrect(){
        Correct.stop()
        Correct.currentTime = 0.0
        Correct.play()
    }
    private func playSoundWrong(){
        Wrong.stop()
        Wrong.currentTime = 0.0
        Wrong.play()
    }
    
    func soundFlow(Bool:Bool) {
        withAnimation() {
            self.shoes.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if shoes == false{
                    playSoundCorrect()
                }
            }
        }
        
    }

    

    
    var body: some View {
        
            ZStack {
                
                BackView()
                
                ForEach(items, id: \.self)  { num in
                        Image(num)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .background(Color.white)
                        .offset(self.items.last == num ? transration : .zero)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    self.transration = value.translation
                                    print("value: ", value.location)
                                })
                                .onEnded({ value in
                                    if value.startLocation.y - 150 > value.location.y {
                                        self.transration = .init(width: 0  , height: -800)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            self.items.removeLast()
                                           
                                                withAnimation() {
                                                    self.shoes.toggle()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                        if shoes == false{
                                                                playSoundCorrect()
                                                            
                                                        }
                                                    }
                                                }
                                            
                                            withAnimation() {
                                                self.kutsushita.toggle()
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    if kutsushita == false{
                                                        playSoundWrong()
                                                        
                                                    }
                                                }
                                            }
                                            
                                            self.transration = .zero
                                        }
                                    } else if value.startLocation.y + 150 < value.location.y {
                                        self.transration = .init(width: 0  , height: +800)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            self.items.removeLast()
                                            withAnimation() {
                                                self.shoes.toggle()
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    if shoes == false{
                                                        playSoundWrong()
                                                        
                                                    }
                                                }
                                            }
                                            self.transration = .zero
                                        }
                                    } else {
                                        self.transration = .zero
                                    }
                                })
                        )
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1))
                    

                    if shoes == false {
                        ZStack {
                            SplashSuccessScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(shoes ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                        }
                    }
                    
                    
                }
            }
    }
}

struct SwipGarbage_Previews: PreviewProvider {
    static var previews: some View {
        SwipGarbage()
    }
}
