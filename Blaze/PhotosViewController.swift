//
//  PhotosTableViewController.swift
//  Blaze
//
//  Created by Ravi Tripathi on 22/07/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Kingfisher

class PhotosViewController: UITableViewController {
    
    var photoUrlDataSource: Array<DataSnapshot> = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        let uid = Auth.auth().currentUser!.uid
        ref = Database.database().reference().child("users").child(uid)
        // Listen for new comments in the Firebase database
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ref.observe(.childAdded, with: { (snapshot) -> Void in
            self.photoUrlDataSource.append(snapshot)
//            self.tableView.insertRows(at: [IndexPath(row: self.photoUrlDataSource.count-1, section: 1)], with: UITableViewRowAnimation.automatic)
            self.tableView.reloadData()
        })
        // Listen for deleted comments in the Firebase database
        ref.observe(.childRemoved, with: { (snapshot) -> Void in
            let index = self.indexOfMessage(snapshot)
            self.photoUrlDataSource.remove(at: index)
//            self.tableView.deleteRows(at: [IndexPath(row: index, section: 1)], with: UITableViewRowAnimation.automatic)
            self.tableView.reloadData()
        })
        
    }
    
    func indexOfMessage(_ snapshot: DataSnapshot) -> Int {
        var index = 0
        for  photo in self.photoUrlDataSource {
            if snapshot.key == photo.key {
                return index
            }
            index += 1
        }
        return -1
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.photoUrlDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoViewCell", for: indexPath) as! PhotoTableViewCell
        if indexPath.row < self.photoUrlDataSource.count {
            let snapShot = self.photoUrlDataSource[indexPath.row]
            let url = URL(string: snapShot.value as! String)
            cell.imageView?.kf.setImage(with: url)
        }
//        cell.imageView?.image = #imageLiteral(resourceName: "fire-icon")
        return cell
        
    }
    
    
    
}
