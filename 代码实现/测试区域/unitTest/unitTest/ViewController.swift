//
//  ViewController.swift
//  unitTest
//
//  Created by 张俊凯 on 2017/5/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("自定义测试")
        let a = 3
        //assert(a == 0)
        
        //闭包的使用
        typealias add = (NSInteger,NSInteger)->(NSInteger)
        var adda:add
        adda = {
            (_ num1:NSInteger,_ num2:NSInteger) -> (NSInteger) in
            return num1 + num2
        }
        print(adda(2,3))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

