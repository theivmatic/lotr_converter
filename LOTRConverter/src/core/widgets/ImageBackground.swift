//
//  ImageBackground.swift
//  LOTRConverter
//
//  Created by Александр on 15.10.2026.
//

import SwiftUI

struct ImageBackground: View {
    var image: ImageResource
    
    var body: some View {
        Image(image)
            .resizable()
            .ignoresSafeArea()
            .background(.black)
    }
}

#Preview {
    ImageBackground(image: .parchment)
}
