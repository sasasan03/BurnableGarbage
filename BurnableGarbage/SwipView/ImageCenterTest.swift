//
//  ImageCenter.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/18.
//

import SwiftUI

struct ImageCenterTest: View {

    @State var location: CGPoint = CGPoint(x:  2, y: 2)
    
    @State var bangou = 0
    
    var body: some View {

        HStack{
            Spacer()
            VStack {
                Spacer()
                Image("nuigurumi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height:200)
                Spacer()
            }
            Spacer()
        }
    }
}

struct ImageCenter_Previews: PreviewProvider {
    static var previews: some View {
        ImageCenterTest()
    }
}
