//
//  visionViewerOneApp.swift
//  visionViewerOne
//
//  Created by Ayush Anbhore on 10/04/24.
//

import SwiftUI

@main
struct visionViewerOneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 100, height: 100)
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
