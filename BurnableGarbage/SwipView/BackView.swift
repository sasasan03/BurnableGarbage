//
//  SwipGarbageView.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/08/30.
//

import SwiftUI

extension Color {
    static let ligthBlue = Color(red: 0.8, green: 1.0, blue: 1.0)
    static let ligthOrange = Color(red: 1.0, green: 0.6, blue: 0.4)
}

struct BackView: View {
    
    var body: some View {
        
            
        VStack(spacing: 0) {
                ZStack {
                    Color.ligthBlue
                    Text("もえるごみ")
                        .font(.system(size: 80))
                        .frame(width: 900, height: 400, alignment: .top)
                }
                ZStack {
                    Color.ligthOrange
                    Text("プラスチックごみ")
                        .font(.system(size: 80))
                        .frame(width: 900, height: 400, alignment: .bottom)
                }
            }.ignoresSafeArea(edges: .top)
            
        }
}

struct SwipGarbageView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
