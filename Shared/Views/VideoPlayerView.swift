//
//  VideoPlayerView.swift
//  SharePlayVideoPlayer
//
//  Created by Tristan Thomson on 24/05/2023.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    @ObservedObject var viewModel: SharePlayViewModel
    var body: some View {
        ZStack {
            let url = URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
            let player = AVPlayer(url: url)
            VideoPlayer(player: player)
        } .task {
            for await session in SharePlayActivity.sessions() {
                viewModel.configureGroupSession(session)
            }
        }
    }
}

//struct VideoViewController: AVPlayerViewController {
//
//}
