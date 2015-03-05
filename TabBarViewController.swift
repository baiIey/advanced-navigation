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
    
    var homeViewController : HomeViewController!
    var searchViewController : SearchViewController!
    var accountViewController : AccountViewController!
    var trendingViewController : TrendingViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButton(sender: AnyObject) {
    }
    
    @IBAction func searchButton(sender: AnyObject) {
    }
    
    @IBAction func composeButton(sender: AnyObject) {
    }

    @IBAction func accountButton(sender: AnyObject) {
    }
    
    @IBAction func trendingButton(sender: AnyObject) {
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
