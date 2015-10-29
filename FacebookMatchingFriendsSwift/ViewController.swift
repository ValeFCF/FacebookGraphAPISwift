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

class ViewController: UIViewController, FBSDKLoginButtonDelegate, FBSDKGameRequestDialogDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if ((FBSDKAccessToken.currentAccessToken()) == nil){
            print("Not logged in..")
        }
        else{
            print("Logged in..")
            
           /*FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields": "id, name, picture.type(large)" ] ).startWithCompletionHandler({ (connection, result, error) -> Void in
                //picture.type(large)
                if error == nil {
                    print(result);
                }
                
            })*/
            
           /* FBSDKGraphRequest.init(graphPath: "me/friends", parameters: ["fields": "id, name, picture{url}", "limit": "5"] ).startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if error == nil {
                    print(result);
                }
                
            })*/
            
            FBSDKGraphRequest.init(graphPath: "me/friends", parameters: ["fields": "name, id"] ).startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if error == nil {
                    
                    let data = result as! NSDictionary
                    let data3 = data["data"]![0]["id"] as AnyObject

                    print( data3 )
                    
                    let gameRequestContent = FBSDKGameRequestContent()
                    gameRequestContent.message = "YOUR_MESSAGE_HERE";
                    gameRequestContent.title = "OPTIONAL TITLE";
                    gameRequestContent.recipients = [ data3 ]
                    
                    // Assuming self implements <FBSDKGameRequestDialogDelegate>
                    FBSDKGameRequestDialog.showWithContent(gameRequestContent, delegate: self)
                    
                    
                } else {
                    print("Error: \(error.localizedDescription)")
                }
                
            })

            
    
            
            
            
            
            
            
            
            
            
            
            
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
            
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logOut")
    }


    //Mark - FBSDKGameRequestDialogDelegate
    
    func gameRequestDialog(gameRequestDialog: FBSDKGameRequestDialog!, didCompleteWithResults results: [NSObject : AnyObject]!) {
        print("didCompleteWithResults:")
        print(results)
    }
    
    func gameRequestDialog(gameRequestDialog: FBSDKGameRequestDialog!, didFailWithError error: NSError!) {
        print("didFailWithError")
    }
    
    func gameRequestDialogDidCancel(gameRequestDialog: FBSDKGameRequestDialog!) {
        print("gameRequestDialogDidCancel")
    }
    
    
    
    

}

