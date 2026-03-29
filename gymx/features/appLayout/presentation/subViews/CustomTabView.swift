//
//  CustomTabView.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/03/26.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.self) { tab in
                ButtonTabItem(tab: tab, selectedTab: $selectedTab)
            }
        }
        .padding(.horizontal)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}
