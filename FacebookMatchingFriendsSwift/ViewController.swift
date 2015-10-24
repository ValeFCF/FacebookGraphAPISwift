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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if ((FBSDKAccessToken.currentAccessToken()) == nil){
            print("Not logged in..")
        }
        else{
            print("Logged in..")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self //important!
        loginButton.center = self.view.center
        loginButton.readPermissions =  ["public_profile", "email", "user_friends"]
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark - FBSDKLoginButtonDelegate
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {

        
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logOut")
    }



}

