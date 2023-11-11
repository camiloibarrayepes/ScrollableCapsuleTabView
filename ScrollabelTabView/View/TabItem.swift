//
//  TabItem.swift
//  ScrollabelTabView
//
//  Created by Camilo Ibarra yepes on 11/11/23.
//

import SwiftUI

struct TabItem: View, Equatable {
    let name: String
    let image: Image

    init(
        name: String,
        image: Image
    ) {
        self.name = name
        self.image = image
    }

    var body: some View {
        HStack(spacing: 10) {
            image
            Text(name).font(.callout)
        }
    }
}
