//
//  ViewController.swift
//  FacebookMatchingFriendsSwift
//
//  Created by Emmanuel Valentín Granados López on 23/10/15.
//  Copyright © 2015 DevWorms. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if ((FBSDKAccessToken.currentAccessToken()) == nil){
            print("Not logged in..")

        }else{
            print("Logged in..")
            
           /*
            FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields": "id, name, picture.type(large)" ] ).startWithCompletionHandler({ (connection, result, error) -> Void in
                //picture.type(large)
                if error == nil {
                    print(result);
                }
                
            })
            */
            
            /*
            FBSDKGraphRequest.init(graphPath: "me/friends", parameters: ["fields": "id, name, picture{url}", "limit": "5"] ).startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if error == nil {
            print(result);
            }
            
            })
            */
            
            self.performSegueWithIdentifier("SegueFriends", sender: nil)
            
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self //important!
        loginButton.center = self.view.center
        loginButton.readPermissions =  ["user_friends"]
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark - FBSDKLoginButtonDelegate
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {

        if error != nil {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // Navigate to other view
            self.performSegueWithIdentifier("SegueFriends", sender: nil)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logOut")
    }
    
    @IBAction func getRequestsFB(sender: AnyObject) {
        
        FBSDKGraphRequest.init(graphPath: "me/apprequests", parameters: ["fields": ""] ).startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if error == nil {
                
                print("obtener requests")
                print( result )
                
            } else {
                print("Error: \(error.localizedDescription)")
            }
            
        })
    }
    
    @IBAction func sendRequestFB(sender: AnyObject) {
        
        FBSDKGraphRequest.init(graphPath: "/891037637654953/apprequests?to=967617393297684&message=RZ1", parameters: nil , HTTPMethod: "POST").startWithCompletionHandler({ (connection, result, error) -> Void in
                    
                    if error == nil {
                        
                        print("manda request")
                        print( result )
                        
                    } else {
                        print("Error: \(error.localizedDescription)")
                    }
                    
                })
        //me/apprequests?message=fiu&data=hola&ids=891037637654953
     }
    
    @IBAction func deleteRequestFB(sender: AnyObject) {
        
        FBSDKGraphRequest.init(graphPath: "/", parameters: [ "ids":"332770816893178_891037637654953,954407707957585_891037637654953,1488676208128891_891037637654953,462670590583628_891037637654953" ] , HTTPMethod: "DELETE").startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if error == nil {
                
                print("elimina request")
                print( result )
                
            } else {
                print("Error: \(error.localizedDescription)")
            }
            
        })
    }
    
    @IBAction func toFriendsFB(sender: AnyObject) {
        
        self.performSegueWithIdentifier("SegueFriends", sender: nil)
    }
    
    
}

