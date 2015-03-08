//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Brian Bailey on 3/4/15.
//  Copyright (c) 2015 nevver. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeView: UIImageView!
    @IBOutlet weak var loginForm: UIImageView!
    @IBOutlet weak var loginContainer: UIView!
    
    var loginContainerOrigin : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginContainer.alpha = 0.0
        loginContainerOrigin = loginContainer.center.y

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = homeView.image!.size
        loginContainerOrigin = loginContainer.center.y
        loginContainer.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButton(sender: AnyObject) {
        // move the login container down and fade it in
        loginContainer.center.y = loginContainerOrigin - 10
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
//            self.loginContainer.hidden = !self.loginContainer.hidden
//            println("\(self.loginContainer.hidden)")
                self.loginContainer.alpha = 1.0
                self.loginContainer.center.y = self.loginContainerOrigin
        })
    }

    @IBAction func logInFormButton(sender: AnyObject) {
                // move the login container down and fade it out
        loginContainer.center.y = loginContainerOrigin
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.loginContainer.alpha = 0.0
            self.loginContainer.center.y = self.loginContainerOrigin + 10
        })
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
