//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image: Image
    var body: some View {
        image
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(image: Image(systemName: "pencil"))
    }
}
