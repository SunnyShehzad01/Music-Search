//
//  FindYourMusicApp.swift
//  FindYourMusic
//
//  Created by Sunny Shehzad on 29/03/22.
//

import SwiftUI

@main
struct FindYourMusicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SongListViewModel())
        }
    }
}
