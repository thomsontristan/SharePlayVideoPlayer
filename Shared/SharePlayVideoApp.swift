//
//  SharePlayVideoApp.swift
//  Shared
//
//  Created by Tristan Thomson
//

import AVKit
import SwiftUI
import GroupActivities

@main
struct SharePlayVideoApp: App {
    var body: some Scene {
        WindowGroup {
            let viewController = VideoPlayerViewController()
            VideoView(viewController: viewController)
        }
    }
}
