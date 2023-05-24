//
//  SharePlayVideoApp.swift
//  Shared
//
//  Created by Tristan Thomson
//

import AVKit
import SwiftUI

@main
struct SharePlayVideoApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = VideoPlayerViewModel()
            VideoView(viewModel: viewModel)
        }
    }
}
