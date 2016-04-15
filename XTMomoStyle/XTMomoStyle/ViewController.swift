//
//  ViewController.swift
//  XTMomoStyle
//
//  Created by zjwang on 16/4/15.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
enum HandleDirectionType{
    case HandleDirectionOn
    case HandleDirectionDown
    case HandleDirectionLeft
    case HandleDirectionRight
}

class ViewController: UIViewController, ZLSwipeableViewDelegate, ZLSwipeableViewDataSource {
    let titles = [
    "Turquoise",
    "Green Sea",
    "Emerald",
    "Nephritis",
    "Peter River",
    "Belize Hole",
    "Amethyst",
    "Wisteria",
    "Wet Asphalt",
    "Midnight Blue",
    "Sun Flower",
    "Orange",
    "Carrot",
    "Pumpkin",
    "Alizarin",
    "Pomegranate",
    "Clouds",
    "Silver",
    "Concrete",
    "Asbestos"
    ]
    let colors = [
        "Turquoise",
        "Green Sea",
        "Emerald",
        "Nephritis",
        "Peter River",
        "Belize Hole",
        "Amethyst",
        "Wisteria",
        "Wet Asphalt",
        "Midnight Blue",
        "Sun Flower",
        "Orange",
        "Carrot",
        "Pumpkin",
        "Alizarin",
        "Pomegranate",
        "Clouds",
        "Silver",
        "Concrete",
        "Asbestos"
    ]
    var colorIndex = 0
    var xtSwipeableView: ZLSwipeableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        xtSwipeableView?.frame = CGRectMake(15, 15, self.view.frame.size.width - 30, self.view.frame.size.height - 30)
//        
//        xtSwipeableView?.delegate = self
        xtSwipeableView?.dataSource = self
//        xtSwipeableView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(xtSwipeableView!)
        
        
        var items = ["上", "下", "左", "右"]
        for i in 0...3{
            let btn = UIButton.init(type: UIButtonType.Custom)
            self.view.addSubview(btn)
            btn.frame = CGRectMake(50 + 60 * (CGFloat)(i), self.view.frame.size.height - 90, 50, 50)
            btn.setTitle(items[i], forState: UIControlState.Normal)
            btn.addTarget(self, action: "handle:", forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = i
        }

    }
    func handle(btn: UIButton)
    {
        
        let tagType = btn.tag
        switch tagType{
        case 0:
            self.xtSwipeableView?.swipeTopViewToUp()
        case 1:
            self.xtSwipeableView?.swipeTopViewToDown()
        case 2:
            self.xtSwipeableView?.swipeTopViewToLeft()
        case 3:
            self.xtSwipeableView?.swipeTopViewToRight()
        default:
            print("....")
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.xtSwipeableView?.loadViewsIfNeeded()
    }
    
    // ZLSwipeableViewDelegate
//    func swipeableView(swipeableView: ZLSwipeableView!, didSwipeView view: UIView!, inDirection direction: ZLSwipeableViewDirection) {
//        print("did swipe in direction: %zd\(direction)")
//    }
//    
//    func swipeableView(swipeableView: ZLSwipeableView!, didCancelSwipe view: UIView!) {
//        print("did cancel swipe")
//    }
//    
//    func swipeableView(swipeableView: ZLSwipeableView!, didStartSwipingView view: UIView!, atLocation location: CGPoint) {
//        print("did start swiping at location: x %f, y %f\(location.x)\(location.y)")
//    }
//    
//    func swipeableView(swipeableView: ZLSwipeableView!, didEndSwipingView view: UIView!, atLocation location: CGPoint) {
//        print("did end swiping at location: x %f, y %f\(location.x)\(location.y)")
//    }
//    
//    func swipeableView(swipeableView: ZLSwipeableView!, swipingView view: UIView!, atLocation location: CGPoint, translation: CGPoint) {
//        print("swiping at location: x %f, y %f, translation: x %f, y %f\(location.x)\(location.y)\(translation.x)\(translation.y)")
//    }
    
    // ZLSwipeableViewDataSource
    func nextViewForSwipeableView(swipeableView: ZLSwipeableView!) -> UIView! {
        if self.colorIndex >= self.titles.count {
            self.colorIndex = 0;
        }
        // ++
        let view = CardView.init(frame: swipeableView.bounds)
        view.backgroundColor = UIColor.purpleColor()
        view.labelTitle.text = self.titles[colorIndex];
        self.colorIndex++;
        return view;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

