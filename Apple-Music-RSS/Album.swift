//
//  Album.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import Foundation

struct AlbumResults:Decodable {
    var feed:Albums
}

struct Albums:Decodable {
    var results:[AlbumDetails]
}

struct AlbumDetails:Decodable {
    var artistName:String
    var name:String
    var artworkUrl100:String
    var genres:[GenreDetails]
}

struct GenreDetails:Decodable {
    var name:String
}

