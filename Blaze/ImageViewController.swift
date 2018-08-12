//
//  ImageViewController.swift
//  Blaze
//
//  Created by Ravi Tripathi on 13/08/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let uString = imageUrl, let url = URL(string: uString){
            imageView.kf.setImage(with: url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
