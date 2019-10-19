//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Mario Alberto Barragán Espinosa on 19/10/19.
//  Copyright © 2019 Mario Alberto Barragan Espinosa. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(imageName: "France")
    }
}
