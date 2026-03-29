//
//  Untitled.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/03/26.
//
import SwiftUI
struct ButtonTabItem: View {
    var tab: Tabs
    @Binding var selectedTab: Tabs
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 6) {
                Image(systemName: tab.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(selectedTab == tab ? LinearGradient.purpleLinear : .gray2)
                    .padding(.top, 20)
                
                Circle()
                    .fill(selectedTab == tab ? LinearGradient.purpleLinear : .clear)
                    .frame(width: 6, height: 6)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
