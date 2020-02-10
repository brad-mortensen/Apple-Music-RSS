//
//  ViewController.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var album : UILabel?
    @IBOutlet weak var artist : UILabel?
    @IBOutlet weak var img : UIImageView?
    
    var image = UIImage()
    var artistName = ""
    var albumTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        album?.text = albumTitle
        artist?.text = artistName
        img?.image = image
    }
}


class AlbumCell: UITableViewCell {
    @IBOutlet weak var album : UILabel?
    @IBOutlet weak var artist : UILabel?
    @IBOutlet weak var img : UIImageView?
}
