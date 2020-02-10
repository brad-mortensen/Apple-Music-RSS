//
//  AlbumsViewController.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import UIKit


class AlbumsViewController: UITableViewController {
    
    let myData = [["albumTitle": "Milky Way", "artist":"Bas", "img": "tester"],["albumTitle": "What A Time to Be Alive", "artist":"Drake and Future", "img": ""]]
    
    var albumArr = [AlbumDetails]()
    
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
        
        cell.album?.text = "\(myData[indexPath.row]["albumTitle"]!)"
        cell.artist?.text = "\(myData[indexPath.row]["artist"]!)"
//        cell.album?.text = album["albumTitle]"]
       return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
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
        vc?.artistName = myData[indexPath.row]["artist"]!
        vc?.albumTitle = myData[indexPath.row]["albumTitle"]!
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

