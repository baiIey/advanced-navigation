//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Brian Bailey on 3/4/15.
//  Copyright (c) 2015 nevver. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    @IBOutlet weak var contentView: UIView!
    
    // button outlets to control states
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    // explore pop-up
    @IBOutlet weak var explorePopUp: UIImageView!
    
    var homeViewController : HomeViewController!
    var searchViewController : SearchViewController!
    var accountViewController : AccountViewController!
    var trendingViewController : TrendingViewController!
//    var composeViewController : ComposeViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set-up explore pop-up visibility and animation
        explorePopUp.alpha = 1
        explorePopUp.hidden = false
        var explorePopUpOrigin = explorePopUp.center.y
        UIView.animateWithDuration(1.0, delay: 0, options: .Repeat | .Autoreverse, animations: { () -> Void in
            self.explorePopUp.center.y = explorePopUpOrigin + 5
        }) { (Bool) -> Void in
        }
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewStory") as SearchViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewStory") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewStory") as TrendingViewController
//        composeViewController = storyboard.instantiateViewControllerWithIdentifier("composeViewStory") as ComposeViewController
        
        var homeView = homeViewController.view
        homeView.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
        defaultButtonState()
        homeButton.selected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func homeButton(sender: AnyObject) {
        var homeView = homeViewController.view
        homeView.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
        defaultButtonState()
        homeButton.selected = true
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        var searchView = searchViewController.view
        searchView.frame = contentView.frame
        contentView.addSubview(searchViewController.view)
        defaultButtonState()
        searchButton.selected = true
        explorePopUp.hidden = true // hide explore pop-up when user goes to search
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    @IBAction func composeButton(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
//        contentView.addSubview(composeViewController.view)
    }

    @IBAction func accountButton(sender: AnyObject) {
        var accountView = accountViewController.view
        accountView.frame = contentView.frame
        contentView.addSubview(accountViewController.view)
        defaultButtonState()
        accountButton.selected = true
    }
    
    @IBAction func trendingButton(sender: AnyObject) {
        var trendingView = trendingViewController.view
        trendingView.frame = contentView.frame
        contentView.addSubview(trendingViewController.view)
        defaultButtonState()
        trendingButton.selected = true
    }
    
    func defaultButtonState(){ // return all buttons to default state
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
    }
    
    
//    Implement the transition delegate methods.
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
//    Finally, implement the method that actually controls the transition.
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
//    The final step is to implement the animateTransition method above which controls the custom transition. In animateTransition, you have access to a containerView which will contain the views of both the source and destination view controller. You also have access to the source and destination view controller.
//    
//    In order to animate the transition, you generally have to add the view of the destination view controller to the container view and schedule the desired animations. In the completion block of the animation, it's important to call completeTransition on the transitionContext to return it to a consistent state.
//    
//    For example, to fade the view controller, do the following:
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
        println("animating compose transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
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
