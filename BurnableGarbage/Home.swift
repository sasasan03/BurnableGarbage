//
//  Home.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/28.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
            ZStack(alignment: .center) {
                
                LottieView(name: "garbageCharacter")
                    .frame(width:900, height: 1100)
                    .background(Color.cyan)
                    
                
                Text("ゴミをわけよう")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .padding(.bottom, 900)
            }
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
