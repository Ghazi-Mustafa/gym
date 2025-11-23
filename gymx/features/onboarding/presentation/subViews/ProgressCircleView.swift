//
//  ProgressCircleView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/11/25.
//

import SwiftUI

struct ProgressCircleView: View {
    let progress : CGFloat
    let size : CGFloat
    var body: some View {
        Circle()
            .trim(from: 0,to: progress)
            .stroke(LinearGradient(colors: [
                Color(hex: "9DCEFF"),
                Color(hex: "92A3FD")
            ], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 3,)
            .frame(width: size,height: size)
            .rotationEffect(.degrees(-90))
            .foregroundStyle(.yellow)
    }
}

