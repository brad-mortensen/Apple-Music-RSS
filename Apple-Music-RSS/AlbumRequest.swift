//
//  AlbumRequest.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import Foundation

enum AlbumError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct AlbumRequest {
    let resourceUrl:URL
    
    init(quantity: String) {
        let resourceString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/\(quantity)/explicit.json"
        guard let resourceUrl = URL(string: resourceString) else {fatalError()}
        self.resourceUrl = resourceUrl
    }
    
    func getAlbums (completion: @escaping(Result<[AlbumDetails], AlbumError>)-> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceUrl) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            print("JSON!!!: \(jsonData)")
            do {
                let decoder = JSONDecoder()
                let albumsResponse = try decoder.decode(AlbumResults.self, from: jsonData)
                print("Album Res: \(albumsResponse)")
                let albumDetails = albumsResponse.results.albums
                completion(.success(albumDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
