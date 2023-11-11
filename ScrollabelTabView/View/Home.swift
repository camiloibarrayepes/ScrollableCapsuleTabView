//
//  Home.swift
//  ScrollabelTabView
//
//  Created by Camilo Ibarra yepes on 11/11/23.
//

import SwiftUI

struct Home: View {

    @State private var selectedTab: TabItem?
    @Environment(\.colorScheme) private var scheme
    @State private var tabProgress: CGFloat = 0
    var tabs: [TabItem] = [
        TabItem(name: "Images", image: Image(systemName: "photo")),
        TabItem(name: "Video", image: Image(systemName: "film")),
        TabItem(name: "Files", image: Image(systemName: "doc"))
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Button (action: {}, label: {
                    Image(systemName: "star")
                })
                Spacer()
                Button (action: {}, label: {
                    Image(systemName: "heart")
                })
            }
            .font(.title2)
            .overlay {
                Text("Tab View Example").font(.title3.bold())
            }
            .foregroundColor(.primary)
            .padding(12)
            TabBar()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray.opacity(0.1))
    }

    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.name) { tab in
                tab
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(Capsule())
                .onTapGesture {
                    withAnimation(.easeIn) {
                        selectedTab = tab
                        if let selectedIndex = tabs.firstIndex(of: tab) {
                            tabProgress = CGFloat(selectedIndex) / (CGFloat(tabs.count) - 1.0)
                        }
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(tabs.count)
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
                
            }
        }
        .background(.gray.opacity(0.1), in: Capsule())
        .padding(.horizontal, 15)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
