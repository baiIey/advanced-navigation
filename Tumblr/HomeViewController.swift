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
        
//        In the init or viewDidLoad methods, register for keyboard events and tie them to the methods
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
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
//        loginContainer.center.y = loginContainerOrigin - 10
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.loginContainer.alpha = 1.0
            self.loginContainer.center.y = self.loginContainerOrigin
        })
        
//
    }

    @IBAction func logInFormButton(sender: AnyObject) {
        // move the login container down and fade it out
        self.view.endEditing(true) // dimiss keyboard
//        loginContainer.center.y = loginContainerOrigin
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
                self.loginContainer.alpha = 0.0
//                self.loginContainer.center.y = self.loginContainerOrigin + 10
           
        })
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    // hide the keyboard when tapping outside of the login container
    @IBAction func onViewTap(sender: UITapGestureRecognizer) {
        println("Tap view")
        self.view.endEditing(true) // dimiss keyboard
    }
    
    
    // define methods to call when the keyboard is shown and hidden
    func keyboardWillShow(notification: NSNotification!) {
        println("Show keyboard")
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = self.loginContainerOrigin - 50
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        println("Hide keyboard")
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            self.loginContainer.center.y = self.loginContainerOrigin
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
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
