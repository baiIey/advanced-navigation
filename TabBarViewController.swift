//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Brian Bailey on 3/4/15.
//  Copyright (c) 2015 nevver. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    // button outlets to control states
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController : HomeViewController!
    var searchViewController : SearchViewController!
    var accountViewController : AccountViewController!
    var trendingViewController : TrendingViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewStory") as SearchViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewStory") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewStory") as TrendingViewController
        
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
    }
    
    @IBAction func composeButton(sender: AnyObject) {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
