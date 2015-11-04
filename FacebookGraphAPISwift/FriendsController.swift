//
//  InviteFriendsController.swift
//  FacebookMatchingFriendsSwift
//
//  Created by Emmanuel Valentín Granados López on 31/10/15.
//  Copyright © 2015 DevWorms. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class InviteFriendsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendInvitationFB(sender: AnyObject) {
        
        
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellFriend", forIndexPath: indexPath) as UITableViewCell
        
        FBSDKGraphRequest.init(graphPath: "me/friends", parameters: [ "fields": "id, name, picture.type(large){url}" ] ).startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if error == nil {
                
                let data = result as! NSDictionary
                let nameFriend = data["data"]![0]["name"] as! String
                let pictureFriend = data["data"]![0]["picture"]!["data"]!["url"] as! String
                
                let url = NSURL(string: pictureFriend)
                let picData = NSData(contentsOfURL: url!)
                
                print(nameFriend)
                //print(picData)
                
                let imageViewP = cell.viewWithTag(1) as! UIImageView
                imageViewP.image = UIImage(data: picData!)
                
                let nameFBfriend = cell.viewWithTag(2) as! UILabel
                    nameFBfriend.text = nameFriend
                
            } else {
                print("Error: \(error.localizedDescription)")
            }
            
        })
        
        //(named: imagesArray[indexPath.row] )


        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
