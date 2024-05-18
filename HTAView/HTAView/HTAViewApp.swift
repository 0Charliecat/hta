//
//  HTAViewApp.swift
//  HTAView
//
//  Created by CharlieCat on 18. 05. 2024.
//

import SwiftUI
import WebView

@main
struct HTAViewApp: App {
    var body: some Scene {
        
        DocumentGroup(viewing: HTADocument.self) { configuration in
            ContextView(path: configuration.fileURL!)
        }
            .windowResizability(.contentSize)
        
    }
}
