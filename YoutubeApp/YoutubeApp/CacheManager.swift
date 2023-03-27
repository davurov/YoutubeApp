//
//  CacheManager.swift
//  YoutubeApp
//
//  Created by Abduraxmon on 27/03/23.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()

    static func setVideoCache(_ url: String, _ data: Data?) {
        
    }
    static func getVideoCache(_ url: String) -> Data? {
        cache[url]
    }
    
}
