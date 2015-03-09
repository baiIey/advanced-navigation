//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Brian Bailey on 3/4/15.
//  Copyright (c) 2015 nevver. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchFeedView: UIImageView!
    
    // loading indicators fire in this order:
    @IBOutlet weak var loading1: UIImageView!
    @IBOutlet weak var loading2: UIImageView!
    @IBOutlet weak var loading3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println("search view loaded")
        
        searchFeedView.alpha = 0
        loading1.alpha = 1
        loading2.alpha = 0
        loading3.alpha = 0
        
        delay(0.3, { () -> () in
            self.loading1.alpha = 0
            self.loading2.alpha = 1
            self.loading3.alpha = 0
        })
        delay(0.6, { () -> () in
            self.loading1.alpha = 0
            self.loading2.alpha = 0
            self.loading3.alpha = 1
        })
        delay(1.0, { () -> () in
            self.loading1.alpha = 1
            self.loading2.alpha = 0
            self.loading3.alpha = 0
        })
        delay(1.3, { () -> () in
            self.loading1.alpha = 0
            self.loading2.alpha = 1
            self.loading3.alpha = 0
        })
        delay(1.6, { () -> () in
            self.loading1.alpha = 0
            self.loading2.alpha = 0
            self.loading3.alpha = 1
        })
        delay(2.0, { () -> () in
            self.loading1.alpha = 1
            self.loading2.alpha = 0
            self.loading3.alpha = 0
        })
        delay(2.1, { () -> () in
            self.loading1.alpha = 0
            self.loading2.alpha = 0
            self.loading3.alpha = 0
        })
        delay(2.3, { () -> () in
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                println("fade in search results")
                self.searchFeedView.alpha = 1
            })

        })

        
        scrollView.contentSize = searchFeedView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
