//
//  MainViewController.swift
//  InstaParse
//
//  Created by Cong Tam Quang Hoang on 13/03/17.
//  Copyright © 2017 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit
import Parse
import AFNetworking

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension

        var query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?,error: Error?) in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(posts!.count) scores.")
                // Do something with the found objects
                if let posts = posts {
                    self.posts = posts
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("error")
            }
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.present(vc, animated: true, completion: nil)
    }

    @IBAction func onPost(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController")
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let caption = posts[indexPath.row]["caption"] as! String?
        
        cell.captionLabel.text = caption
        let picture = posts[indexPath.row]["media"]
        
        (picture as AnyObject).getDataInBackground(block: { (imageData: Data?, error: Error?) in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data:imageData)
                    cell.imagePosted.image = image
                    
                }
            }
        })
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts{
            return posts.count
        }else{
            return 0
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?,error: Error?) in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(posts!.count) scores.")
                // Do something with the found objects
                if let posts = posts {
                    self.posts = posts
                    self.tableView.reloadData()
                }
            } else {
                // Log details of the failure
                print("error")
            }
            
        }
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
