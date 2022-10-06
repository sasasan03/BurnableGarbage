//
//  CGpointMove.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/23.
//

import SwiftUI
//課題
//.positionの値をUIscreenを使うと正常な動作になる
struct DragGestureView: View {
    @State var offset: CGSize = CGSize(width: 0, height: 0)
   
//    @State var startPoint: CGPoint = CGPoint(x:  ,y: )
//    @State var transation: CGSize = .zero
//    private func dragOnChanged(value: DragGesture.Value) {
//        transation = value.translation
//    }
//    @State var hoge = GeometryReader.
    
    var body: some View {
        
            GeometryReader { geometry in
    //             var location : CGPoint = CGPoint(
    //                x: geometry.size.width / 2,
    //                y: geometry.size.height * 0.5)
                let dragGesture = DragGesture()

                    .onChanged({ value in
                        offset = value.translation
                    })
                    .onEnded { _ in
                        offset = CGSize(width: 0, height: 0)
                            
//                        offset = value.translation

                    }
                VStack {
                    HStack{
                        Text("\(offset.width)")
                        Text("\(offset.height)")
                    }
                    
                    Image("kamikuzu")
                        .resizable()
                        .scaledToFit()
                        .offset(offset)
                    //問題なし
                        .frame(width: geometry.size.width * 0.4,height:  geometry.size.height * 0.4)
                    //geometryだと不具合発生
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    //            (x: geometry.size.width / 2 + location.x,
                    //                          y: geometry.size.height * 0.5 + location.y)
                        .gesture(dragGesture)
                }
    //                    DragGesture()
    //                        .onChanged({ value in
    //
    //ドラッグしようとしたら、CGPointの（x:0y:0）に行ってまう(.zero)
    //                          location = value.location
    //                        })
    //                        .onEnded({ value in
    //
    //                        })
    //                    )
            }

    }
}

struct CGpointMove_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
