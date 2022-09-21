//
//  MiddleView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/19.
//

import SwiftUI
import AVFoundation

struct TouchGarbage: View {
    
    @State private var plastic = true
    @State private var kamikuzu = true
    @State private var nuigurumi = true
    @State private var shoes = true
    @State private var notebook = true
    @State private var kutsushita = true
    
    @State var counter:Int = 0
    
    @Binding var ButtonGarbageOn: Bool
    @Binding var HomeOn: Bool
    
    var body: some View {
        

            VStack {
                
                HStack{
                    
                    Button(action: {
                        ButtonGarbageOn = false
                        HomeOn = true
                    }) {
                        Text("やめる")
                            .font(.system(size: 30))
                            .foregroundColor(Color.red)
                            .fontWeight(.black)
                            .lineLimit(1)
                            .minimumScaleFactor(1.0)
                    }
                    Spacer()
                    
                    Button {
                        plastic = true
                        kamikuzu = true
                        nuigurumi = true
                        shoes = true
                        notebook = true
                        kutsushita = true
                    } label: {
                        Text("やりなおす")
                            .font(.system(size: 30))
                            .foregroundColor(Color.blue)
                            .fontWeight(.black)
                            .lineLimit(1)
                            .minimumScaleFactor(1.0)
                    }

                }
                
                Spacer()
                
                Text("プラスチックごみはどれ？？")
                    .font(.system(size: 55))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .padding()
                
                Spacer()
                
                HStack {
                                        
                    Button {
                        withAnimation() {
                            shoes.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if shoes == false{
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if shoes {
                        Image("shoes")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: 350, y: 800))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                        //.dieabled効かない
                    }.disabled(counter >= 1)

                    
                    Button {
                        withAnimation() {
                            nuigurumi.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if nuigurumi == false{
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if nuigurumi {
                            Image("nuigurumi")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: 0, y: 550))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        withAnimation() {
                            notebook.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if notebook == false{
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if notebook {
                            Image("notebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: -250, y: 550))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                }
                HStack {
                    
                    Button {
                        withAnimation() {
                            kutsushita.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if kutsushita == false{
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if kutsushita {
                            Image("kutsushita")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: 600, y: 800))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        withAnimation() {
                            self.plastic.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if plastic == false{
                                    playSoundCorrect()
                                }
                            }
                        }
                    } label: {
                        if plastic {
                            Image("plastic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: 0, y: 300))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button {
                        withAnimation() {
                            kamikuzu.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if kamikuzu == false{
                                    playSoundWrong()
                                }
                            }
                        }
                    } label: {
                        if kamikuzu {
                            Image("kamikuzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230, height: 230)
                                .transition(AnyTransition.offset(x: -300, y: 550))
                        } else {
                            Rectangle()
                                .frame(width: 230, height: 230)
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                }
                
                Spacer()

                ZStack {

                    Image("gomibukuro")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)


                    if shoes == false {
                        SplashErrorhScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(shoes ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                    }
                    
                    if nuigurumi == false {
                        SplashErrorhScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(nuigurumi ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                    }

                    if notebook == false{
                        SplashErrorhScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(notebook ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.5))
                    }

                    if kutsushita == false{
                        SplashErrorhScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(kutsushita ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                    }

                    if plastic == false{
                        SplashSuccessScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(plastic ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                    }

                    if kamikuzu == false{
                        SplashErrorhScreen()
                                .frame(width: 200, height: 200)
                                .scaleEffect(kamikuzu ? 2.0 : 2.0)
                                .animation(
                                    .default.delay(0.2))
                    }
                }
            }
        }
       
    }

        

struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        TouchGarbage(ButtonGarbageOn: .constant(false), HomeOn: .constant(false))
    }
}
