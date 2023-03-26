//
//  Konstants.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 26/03/23.
//

import Foundation

struct K {
    static var apikey = ""
    static var playlistID = "PLoSWVnSA9vG9qV0CVCpg5WwEy3LiP7udY"
    static var apiUrl = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(K.playlistID)&key=\(K.apikey)"
}
