//
//  SwipGarbageEndMove.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/10/04.
//

import SwiftUI
import Lottie

struct GoodJobView: View {

    @State var show = true

    var body: some View {
        ZStack(alignment: .center) {
            if (show) {
                GoodView(show: $show)
                    .frame(width: 120, height: 120)
            } else {
                // TODO show view after splash lottie animation
            }
        }
    }
}

struct GoodView: UIViewRepresentable {

    @Binding var show: Bool

    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: "goodJob", bundle: Bundle.main)
        // lottie animationを表示開始
        view.play { (status) in
      //  animationView?.completionBlock = { finished in
            if status {
                withAnimation(.spring()) {
                    // 表示が終了したタイミングで表示フラグをOFFに
                    show = false
                }
            }
        }
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


struct GoodJobView_Previews: PreviewProvider {
    static var previews: some View {
        GoodJobView()
    }
}
