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
            
            
            
            let floor = ModelEntity(mesh: .generatePlane(width: 50, depth: 50))
            floor.generateCollisionShapes(recursive: false)
            floor.components[PhysicsBodyComponent.self] = .init(
                
                massProperties: .default,
                mode: .static
                
            )
            
            content.add(floor)
            
            if let dicemodel = try? await Entity(named: "Dice"),
               
                let dice =
                dicemodel.children.first?.children.first{
                
                dice.position.y = 0.5
                dice.position.z = -1
                dice.scale = [10,10,10]
                
                dice.generateCollisionShapes(recursive: false)
                dice.components.set(InputTargetComponent())
                
                dice.components[PhysicsBodyComponent.self] = .init(PhysicsBodyComponent(
                    
                    massProperties: .default,
                    material: .generate(staticFriction: 0.8, dynamicFriction: 0.5, restitution: 0.1),
                    mode: .dynamic
                    
                ))
                dice.components[PhysicsMotionComponent.self] = .init()
                
                content.add(dice)
            }
            
        }
        .gesture(dragGesture)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                value.entity.position = value.convert(value.location3D, from : .local, to: value.entity.parent!)
                value.entity.components[PhysicsBodyComponent.self]?.mode = .kinematic
            }
            .onEnded { value in
                value.entity.components[PhysicsBodyComponent.self]?.mode = .dynamic
                
            }
    }
    
}


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
