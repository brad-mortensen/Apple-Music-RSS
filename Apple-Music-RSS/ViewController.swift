//
//  ViewController.swift
//  Apple-Music-RSS
//
//  Created by Bradley Mortensen on 2/9/20.
//  Copyright © 2020 Brad Mortensen. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var img : UIImageView?
    @IBOutlet weak var album : UILabel?
    @IBOutlet weak var artist : UILabel?
    @IBOutlet weak var genre : UILabel?
    
    var image = "" {
        didSet {
            image = String(image[..<image.index(image.endIndex, offsetBy: -13)]) + "400x400bb.png"
        }
    }
    var artistName = ""
    var albumTitle = ""
    var albumGenre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        album?.text = albumTitle
        artist?.text = artistName
        img?.sd_setImage(with: URL(string: image))
        genre?.text = albumGenre
    }
}


class AlbumCell: UITableViewCell {
    @IBOutlet weak var album : UILabel?
    @IBOutlet weak var artist : UILabel?
    @IBOutlet weak var img : UIImageView?
}

//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data:data){
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
