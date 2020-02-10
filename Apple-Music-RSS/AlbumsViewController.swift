//
//  AlbumsViewController.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import UIKit
import SDWebImage


class AlbumsViewController: UITableViewController {
    
//    let myData = [["albumTitle": "Milky Way", "artist":"Bas", "img": "tester"],["albumTitle": "What A Time to Be Alive", "artist":"Drake and Future", "img": ""]]
    
    var albumArr = [AlbumDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(self.albumArr)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let albumRequest = AlbumRequest(quantity: "25")
        albumRequest.getAlbums { [weak self] result in
            switch result {
            case .failure (let error):
                print(error)
            case .success(let albums):
                self?.albumArr = albums
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumCell
        
        cell.album?.text = "\(albumArr[indexPath.row].name)"
        cell.artist?.text = "\(albumArr[indexPath.row].artistName)"
        cell.img?.sd_setImage(with: URL(string: "\(albumArr[indexPath.row].artworkUrl100)"))
       return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArr.count
    }
    // Mark: - Navigation
//     func prepare(for segue: UIStoryboardSegue, sender: Any?, indexPath: IndexPath)
//    {
//        if segue.destination is DetailsViewController
//        {
//            let vc = segue.destination as? DetailsViewController
//            vc?.artistName = myData[indexPath.row]["artist"]!
//            vc?.albumTitle = myData[indexPath.row]["albumTitle"]!
//        }
//    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc?.artistName = albumArr[indexPath.row].artistName
        vc?.albumTitle = albumArr[indexPath.row].name
        vc?.albumGenre = albumArr[indexPath.row].genres[0].name
        vc?.image = albumArr[indexPath.row].artworkUrl100
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

