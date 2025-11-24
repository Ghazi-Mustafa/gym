//
//  CustomDivider.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        HStack(alignment: .center){
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color(hex: "DDDADA"))
                
            Text("Or")
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color(hex: "DDDADA"))
               
        }
        
    }
}

#Preview {
    CustomDivider()
}
