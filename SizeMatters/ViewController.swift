//
//  ViewController.swift
//  SizeMatters
//
//  Created by NIX on 15/7/22.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit
import Ruler

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var boundsLabel: UILabel!
    
    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    @IBOutlet weak var topMargin: NSLayoutConstraint!

    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        boundsLabel.text = "Screen size:" + UIScreen.main.bounds.debugDescription
        
        let statusBarHeight = navigationController!.navigationBar.frame.origin.y
        let navigationBarHeight = navigationController!.navigationBar.frame.height
        let colorViewHeight = colorView.frame.height
        let bottomHeight = UIScreen.main.bounds.height -  navigationBarHeight - colorViewHeight
        
        topLabel.text = "statusBarHeight:\(statusBarHeight) \nnavigationBarHeight: \(navigationBarHeight)"
        bottomLabel.text = "bottomHeight: \(bottomHeight)"
        prioa()
    }
    
    
    func prioa() {
        if #available(iOS 11.0, *) {
            debugPrint(view.safeAreaInsets)
        } else {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // other test

        let width = Ruler.iPhoneHorizontal(10, 20, 30).value
        print("width = \(width)\n")

        let height = Ruler.iPhoneVertical(5, 10, 20, 30, 40, 40).value
        print("height = \(height)\n")

        let iPadWidthOrHeight = Ruler.iPad(20, 50).value
        print("iPadWidthOrHeight = \(iPadWidthOrHeight)\n")

        let universalWidth = Ruler.universalHorizontal(10, 20, 30, 40, 60).value
        print("universalWidth = \(universalWidth)\n")

        let universalHeight = Ruler.universalVertical(5, 10, 20, 30, 40, 50, 60, 60).value
        print("universalHeight = \(universalHeight)\n")

        // thanks generics, Ruler can match anything for different sizes of iOS devices, not just the length!

        colorView.backgroundColor = Ruler.universalVertical(UIColor.black, UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple, UIColor.cyan, UIColor.magenta).value

        typealias Greeting = () -> Void

        let greeting: Greeting = Ruler.universalVertical(
        { print("Hello!") },
        { print("Hi!") },
        { print("How are you!") },
        { print("How do you do!") },
        { print("好久不见！") },
        { print("你好！") },
        { print("很高兴见到你！") },
        { print("你很好！")} ).value

        greeting()

        if ScreenModel.isPhoneX {
            print("It's an iPhone X. You're rich!")
        }
    }
}
