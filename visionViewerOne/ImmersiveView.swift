//
//  ImmersiveView.swift
//  visionViewerOne
//
//  Created by Ayush Anbhore on 10/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let dicemodel = try? await Entity(named: "Dice"),
               
                let dice =
                dicemodel.children.first?.children.first{
                
                dice.position.y = 0.5
                dice.position.x = -1
                dice.scale = [10,10,10]
                content.add(dice)
            }
            
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
