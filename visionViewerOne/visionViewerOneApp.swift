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

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
