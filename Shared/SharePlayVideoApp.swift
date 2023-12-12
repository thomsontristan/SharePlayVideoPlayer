//
//  SharePlayVideoApp.swift
//  SharePlayVideoPlayer
//
//  Created by Tristan Thomson
//

import AVKit
import SwiftUI

@main
struct SharePlayVideoApp: App {
    var body: some Scene {
        WindowGroup {
            let viewController = VideoPlayerViewController()
            VideoView(viewController: viewController)
        }
    }
}

struct VideoView: View {
    @ObservedObject var viewController: VideoPlayerViewController

    var body: some View {
        VStack {
            VideoPlayer(player: viewController.videoPlayer)
        }.task {
            viewController.prepareSharePlay()
            viewController.listenForGroupSession()
        }
    }
}
