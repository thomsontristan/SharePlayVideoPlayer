//
//  VideoView.swift
//  SharePlayVideoPlayer
//
//  Created by Tristan Thomson on 24/05/2023.
//

import AVKit
import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel: VideoPlayerViewModel

    var body: some View {
        VStack {
            VideoPlayer(player: viewModel.videoPlayer)
        }.task {
            viewModel.prepareSharePlay()
            viewModel.listenForGroupSession()
        }
    }
}
