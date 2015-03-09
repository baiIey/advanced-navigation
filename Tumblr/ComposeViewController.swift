//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Brian Bailey on 3/4/15.
//  Copyright (c) 2015 nevver. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var textIcon: UIImageView!
    
    // create variables to store Storyboard positions of each icon
    var quoteIconOrigin : CGFloat!
    var videoIconOrigin : CGFloat!
    var photoIconOrigin : CGFloat!
    var linkIconOrigin : CGFloat!
    var chatIconOrigin : CGFloat!
    var textIconOrigin : CGFloat!
    
    var selectedIcon : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // capture the Storyboard positions of each icon
        textIconOrigin = textIcon.center.y
        photoIconOrigin = photoIcon.center.y
        quoteIconOrigin = quoteIcon.center.y
        linkIconOrigin = linkIcon.center.y
        chatIconOrigin = chatIcon.center.y
        videoIconOrigin = videoIcon.center.y

        // Do any additional setup after loading the view.
        // Animate the buttons into place when the view loads
        
//        self.quoteIcon.center.y = 100.0
//        
//        UIView.animateWithDuration(6.0, animations: { () -> Void in
//            println("buttons are animating into place")
////            self.quoteIcon.center.y = self.quoteIconOrigin
//            self.quoteIcon.center.y = 100.0
//            println("\(self.quoteIconOrigin)")
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nevermindTap(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            print("Animate away from compose")
            // move icons up the page while tapping Nevermind button
            self.textIcon.center.y = self.textIconOrigin - 130.0
            self.photoIcon.center.y = self.photoIconOrigin - 110.0
            self.quoteIcon.center.y = self.quoteIconOrigin - 120.0
            self.linkIcon.center.y = self.linkIconOrigin - 125.0
            self.chatIcon.center.y = self.chatIconOrigin - 100.0
            self.videoIcon.center.y = self.videoIconOrigin - 110.0
        })
        
        
        dismissViewControllerAnimated(true, completion: nil)
        println("tap")
    }

    @IBAction func iconTap(sender: UITapGestureRecognizer) {
        selectedIcon = sender.view as UIImageView
        var selectedIconOrigin = selectedIcon.image!.size
        
        println("Icon tap detected")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            println("animating button!")

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
