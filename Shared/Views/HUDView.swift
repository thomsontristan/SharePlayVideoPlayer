//
//  HUDView.swift
//  SharePlayTutorial (iOS)
//
//  Created by Tristan Thomson
//

import SwiftUI

struct HUDView: View {

    @ObservedObject var viewModel: SharePlayViewModel

    var body: some View {
        HStack {
            Button(action: {
                viewModel.startSharing()
            }) {
                Image(systemName: "shareplay")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.background)
                    .background(.gray)
                    .cornerRadius(10)
            }
            .buttonStyle(.plain)
        }
        .padding(10)
    }
}

struct HUDView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(viewModel: SharePlayViewModel(model: SharePlayModel()))
            .previewLayout(.sizeThatFits)
    }
}
