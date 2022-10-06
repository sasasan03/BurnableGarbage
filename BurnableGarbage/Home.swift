//
//  Home.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/28.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                LottieView(name: "garbageCharacter")
                    .frame(width:geometry.size.width, height: geometry.size.height)
                    .background(Color.cyan)
                
                VStack {
                    HStack{
                        Color.clear
                            .frame(height: geometry.size.height * 0.05)
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFit()
                                .frame(width:  geometry.size.height * 0.06, height: geometry.size.height * 0.06)
                                .padding()
                        }
                    }
//                    Image(systemName: "gearshape.fill")
                        .frame(height: geometry.size.height * 0.05)
                    Text("ゴミをわけよう")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        
                    Spacer()
                }
            }
        }
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
