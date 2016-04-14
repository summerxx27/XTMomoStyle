
//
//  ViewController.swift
//  XTMomoStyle
//
//  Created by zjwang on 16/4/15.
//  Copyright © 2016年 夏天. All rights reserved.
//

import UIKit
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
    var index = 0
    var xtSwipeableView: ZLSwipeableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGrayColor()
        xtSwipeableView = ZLSwipeableView.init()
        xtSwipeableView!.frame = CGRectMake(55, 110, self.view.frame.size.width - 110, self.view.frame.size.height - 220)
        xtSwipeableView!.delegate = self
        xtSwipeableView!.dataSource = self
        xtSwipeableView!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(xtSwipeableView!)
        self.setButton()
    }
    func setButton()
    {
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
            xtSwipeableView!.swipeTopViewToUp()
        case 1:
            xtSwipeableView!.swipeTopViewToDown()
        case 2:
            xtSwipeableView!.swipeTopViewToLeft()
        case 3:
            xtSwipeableView!.swipeTopViewToRight()
        default:
            print("....")
        }
    }
    
    override func viewDidLayoutSubviews() {
        xtSwipeableView!.loadViewsIfNeeded()
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
        if self.index >= self.titles.count {
            self.index = 0
        }
        let view = CardView.init(frame: swipeableView.bounds)
        view.backgroundColor = UIColor.purpleColor()
        view.textLabel?.text = self.titles[index]
        view .initWithClosure(addressThatTakesAClosure)
        self.index++
        return view
    }
    func addressThatTakesAClosure(string:String) ->Void{
        print("\(string)")
    }
    class CardView: UIView {
        ///
        typealias sendValueClosure = (string:String)->Void
        /// 声明一个Closure(闭包)
        var myClosure:sendValueClosure?
        // 下面这个方法需要传入上个界面的someFunctionThatTakesAClosure函数指针
        func initWithClosure(closure:sendValueClosure?){
            myClosure = closure
        }
        ///
        var imagesView: UIImageView?
        var textLabel : UILabel?
        var btn: UIButton?
        ///
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.setView(frame)
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        /// setView
        func setView(frame: CGRect){
            // Shadow
            self.layer.shadowColor = UIColor.lightGrayColor().CGColor
            self.layer.shadowOpacity = 0.33
            self.layer.shadowOffset = CGSizeMake(0, 1.5)
            self.layer.shadowRadius = 4.0
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.mainScreen().scale
            
            // Corner Radius
            self.layer.cornerRadius = 10.0
            
            // Custom view
            imagesView = UIImageView.init(frame: CGRectMake(5, 5, self.frame.size.width - 10, self.frame.size.height / 2))
            imagesView!.backgroundColor = UIColor.whiteColor()
            self.addSubview(imagesView!)
            
            
            textLabel = UILabel.init(frame: CGRectMake(20, imagesView!.frame.size.height + 10, 120, 20))
            textLabel!.backgroundColor = UIColor.lightGrayColor()
            self.addSubview(textLabel!)
            
            btn = UIButton.init(type: UIButtonType.Custom)
            btn?.setTitle("BUTTON", forState: UIControlState.Normal)
            btn?.frame = CGRectMake(20, (textLabel?.frame.origin.y)! + 20 + 10, 100, 50)
            self.addSubview(btn!)
            btn?.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
            
        }
        func btnClick()
        {
            if myClosure != nil{
                self.myClosure!(string: "hello World")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

