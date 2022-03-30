//
//  SongListViewModel.swift
//  FindYourMusic
//
//  Created by Sunny Shehzad on 29/03/22.
//

import Combine
import Foundation
import SwiftUI

class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published public private(set) var songs: [SongViewModel] = []
    
    private let dataModel : DataModel = DataModel()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .sink(receiveValue: loadSongs(searchTerm:))
            .store(in: &disposables)
    }
    
    private func loadSongs(searchTerm: String) {
        songs.removeAll()
        dataModel.loadSongs(searchTerm: searchTerm){ songs in
            songs.forEach { self.appendSong(song:$0) }
        }
    }
    
    private func appendSong(song: Song){
        let songViewModel = SongViewModel(song: song)
        DispatchQueue.main.async {
            self.songs.append(songViewModel)
        }
    }
}

class SongViewModel: Identifiable, ObservableObject {
    let id: Int
    let trackName: String
    let artistName: String
    @Published var artWork: Image?
    
    init(song: Song){
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
    }
}
