//
//  SharePlayViewModel.swift
//  SharePlayTutorial (iOS)
//
//  Created by Tristan Thomson
//

import GroupActivities
import SwiftUI

@MainActor
class SharePlayViewModel: ObservableObject {

    @Published private var model: SharePlayModel

    init(model: SharePlayModel) {
        self.model = model
    }

    var tasks = Set<Task<Void, Never>>()
    var messenger: GroupSessionMessenger?

    func startSharing() {
        Task {
            do {
                _ = try await SharePlayActivity().activate()
            } catch {
                print("Failed to activate SharePlay activity: \(error)")
            }
        }
    }

    func configureGroupSession(_ session: GroupSession<SharePlayActivity>) {
        let messenger = GroupSessionMessenger(session: session)
        self.messenger = messenger

        let task = Task {
            for await (sharePlayModel, _) in messenger.messages(of: SharePlayModel.self) {
                handle(sharePlayModel)
            }
        }
        tasks.insert(task)

        session.join()
    }

    func handle(_ model: SharePlayModel) {
        withAnimation {
            self.model = model
        }
    }

    func send(_ model: SharePlayModel) {
        Task {
            do {
                try await messenger?.send(model)
            } catch {
                print("Send SharePlayModel failed: \(error)")
            }
        }
    }
}
