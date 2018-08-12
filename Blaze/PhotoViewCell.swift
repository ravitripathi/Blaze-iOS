//
//  PhotoViewCell.swift
//  Blaze
//
//  Created by Ravi Tripathi on 13/08/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoViewCell: UITableViewCell {

    @IBOutlet var contentImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadImage(urlString: String?) {
        if let urlString = urlString, let url = URL(string: urlString), let _ = contentImageView {
            contentImageView.kf.setImage(with: url) 
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        // Configure the view for the selected state
    }

    
}
