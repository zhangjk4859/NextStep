//
//  ViewController.swift
//  蘑菇租房要求
//
//  Created by 张俊凯 on 2017/3/15.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class ViewController:UIViewController,UITableViewDataSource{
    
   public var titles:Array<String>?
   private var tableView:UITableView?
   fileprivate var subTitles:Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), style: .plain)
        view.addSubview(tableView)
        tableView.dataSource = self
        self.tableView = tableView
        
        //这个数组决定菜单模块的数量,接口开放出去
        titles = ["A","B","C","D","E","F","G"]
        
        //这个数组存放“显示状态”
        subTitles = [String]()
        //初始化状态数组，显示加载中
        for _ in titles!{
            subTitles?.append("加载中...")
        }
        
        //开始进行耗时操作，GCD进行子线程
          //在真实情况中，viewDidLoad时开始子线程开启加载任务，任务完成后回到主线程，根据任务对应的模块替换显示状态数组，然后刷新界面 tableView.reloadData
        for i in 0..<Int((titles?.count)!){
            
            //开启子线程下载数据
              //insert your code of manipulation of receive data here
            if i == Int((titles?.count)!) - 1{
                //回到主线程更新状态，刷新UI
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3+i)) {
                    self.subTitles?.replaceSubrange(i..<(i+1), with:["加载失败"])
                    self.tableView?.reloadData()
                    
                }
            }else{
                //回到主线程更新状态，刷新UI
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(3+i)) {
                    self.subTitles?.replaceSubrange(i..<(i+1), with:["加载完毕"])
                    self.tableView?.reloadData()
                    
                }
            }
           
            
        }
        

    }

}

//在扩展中实现代理方法，让代码整洁
extension ViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (titles?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = titles?[indexPath.row]
        //默认标题是“加载中”
        cell?.detailTextLabel?.text = subTitles?[indexPath.row]
        cell?.backgroundColor = UIColor.init(colorLiteralRed:Float(arc4random_uniform(255)) / 255.0
            , green: Float(arc4random_uniform(255)) / 255.0
            , blue: Float(arc4random_uniform(255)) / 255.0
, alpha: 1.0)
        
        return cell!
    }
}

