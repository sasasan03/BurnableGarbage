//
//  EndPattern.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/15.
//

import SwiftUI
//TouchGarbageに反映させたい。
struct EndPattern: View {
    
    @State var f1 = false
    @State var f2 = false
    @State var f3 = false
    @State var counter:Int = 0
    
    var body: some View {
        
        VStack{
            
            Button {
                f3 = true
            } label: {
                Image("nuigurumi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
//                    .opacity(f3 ? 0 : 1)
                    .background(Color.black)
            }.isHidden(isShow: f3)
            //.disabled(f3)
            
            VStack{
                if !f1 {
                    Button {
                        f1 = true
                        
                    }label: {
                        Image(systemName: f1 ? "car" : "flame.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .background(Color.black)
                    }
                }
            }.frame(height:200)
            
            
            Button {
                f2 = true
            }
        label: {
            Image(systemName: f2 ? "flame.fill" : "car")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color.black)
        }
        .disabled(counter >= 1)
            
            Button {
                putBack()
            } label: {
                //なぜ中国語に？
                Text("やり直す")
                    .font(.system(size: 60))
            }
            
        }
       
    }
    func putBack() {
        f1 = false
        f2 = false
        f3 = false
    }
    
}
    


extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .background(Color.black)
    }
}

struct EndPattern_Previews: PreviewProvider {
    static var previews: some View {
        EndPattern()
    }
}
