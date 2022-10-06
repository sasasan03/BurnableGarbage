//
//  Test.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/10/04.
//

import SwiftUI

struct SwipViewEndView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                LottieView(name: "goodJob")
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7)
                LottieView(name: "cracker")
                    .frame(width: geometry.size.width * 1.0, height: geometry.size.height * 1.0)
                VStack {
                    Text("よくがんばりました👏🎉")
                        .offset(y: geometry.size.height * 0.3)
                        .frame(height: geometry.size.height)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }
               
                  
                    
                
            }
        }
    }
}

struct SwipViewEndView_Previews: PreviewProvider {
    static var previews: some View {
        SwipViewEndView()
    }
}
