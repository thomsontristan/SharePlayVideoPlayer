//
//  VideoView.swift
//  SharePlayVideoPlayer
//
//  Created by Tristan Thomson on 24/05/2023.
//

import AVKit
import SwiftUI

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
