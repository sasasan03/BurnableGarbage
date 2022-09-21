//
//  Image-Extension.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/19.
//

import SwiftUI

extension View {
// swift：isHidden
  @ViewBuilder func isHidden(isShow: Bool) -> some View {
        if isShow {
             self.hidden()
        }else{
             self
        }
    }
}
