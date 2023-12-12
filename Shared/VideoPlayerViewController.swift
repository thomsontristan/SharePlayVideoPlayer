//
//  VideoPlayerViewController.swift
//  SharePlayVideoPlayer
//
//  Created by Tristan Thomson
//

import GroupActivities
import SwiftUI
import AVKit

@MainActor
class VideoPlayerViewController: ObservableObject {

    private var groupSession: GroupSession<MovieWatchingActivity>?

    var movieToWatch: Movie
    let videoPlayer: AVPlayer

    init(groupSession: GroupSession<MovieWatchingActivity>? = nil) {
        self.groupSession = groupSession
        self.movieToWatch = Movie(url: URL(string: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!, title: "BigBuckBunny", description: "BBB")
        self.videoPlayer = AVPlayer(url: movieToWatch.url)
    }

    func prepareSharePlay() {
        let activity = MovieWatchingActivity(movie: movieToWatch)

        Task {
            switch await activity.prepareForActivation() {
            case .activationDisabled:
                break
            case .activationPreferred:
                _ = try await activity.activate()
            case .cancelled:
                break
            default: ()
            }
        }
    }

    func listenForGroupSession() {
        Task {
            for await session in MovieWatchingActivity.sessions() {
                handleGroupSession(session)
            }
        }
    }

    private func handleGroupSession(_ session: GroupSession<MovieWatchingActivity>) {
        groupSession = session
        videoPlayer.playbackCoordinator.coordinateWithSession(session) //I think this is where it breaks
        session.join()
    }
}

struct Movie: Hashable, Codable {
    var url: URL
    var title: String
    var description: String
}

struct MovieWatchingActivity: GroupActivity {

    static let activityIdentifier = "com.tristanthomson.SharePlayVideoPlayer"
    var movie: Movie

    var metadata: GroupActivityMetadata {
        var meta = GroupActivityMetadata()
        meta.title = movie.title
        meta.subtitle = movie.description
        meta.fallbackURL = URL(string: "https://www.hudl.com")
        meta.type = .watchTogether
        return meta
    }
}
