//
//  EndPattern.swift
//  BurnableGarbage
//
//  Created by sako0602 on 2022/09/15.
//

import SwiftUI

struct EndPattern: View {
    
    @State var f1 = false
    @State var f2 = false
    @State var f3 = false
    
    var body: some View {
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct EndPattern_Previews: PreviewProvider {
    static var previews: some View {
        EndPattern()
    }
}
