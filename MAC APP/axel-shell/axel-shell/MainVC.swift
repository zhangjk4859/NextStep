//
//  MainVC.swift
//  axel-shell
//
//  Created by 张俊凯 on 2017/3/16.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Cocoa

class MainVC: NSViewController,NSTextFieldDelegate {

    var textField:NSTextField?
    var textView:NSTextView?
    
    override func viewDidAppear() {
        super.viewDidAppear()

        let textFiedld = NSTextField(frame: .init(x: 100, y: 200, width: 100, height: 30))
        textFiedld.backgroundColor = NSColor.red
        view.addSubview(textFiedld)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.controlTextDidChange), name: NSNotification.Name.NSControlTextDidChange, object: textFiedld)
        
        let button = NSButton(title:"按钮" , target: self, action: #selector(self.btnClick))
        button.frame = NSRect(x: 100, y: 100, width: 100, height: 100)
        button.layer?.backgroundColor = NSColor.yellow.cgColor
        button.title = "按钮"
        view.addSubview(button)
        
       //左边增加一个竖着的view
        let titles = ["卸载","清理","杀毒","概览"]
        let width:CGFloat = 100
        let totalHeight:CGFloat = 640
        let height = totalHeight / CGFloat(titles.count)
        print(height,totalHeight)
        let leftView =  NSView(frame: NSRect(x: 0, y: 0, width: width, height: totalHeight))
        view.addSubview(leftView)
        leftView.layer?.backgroundColor = NSColor.red.cgColor
         //左边菜单栏从上往下依次添加按钮
        for index in 0..<titles.count {
          let btn = NSButton(frame: NSRect(x: 0, y: CGFloat(index) * height, width: width, height: height))
            leftView.addSubview(btn)
            btn.title = titles[index]
        }
   
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        // You can get the NSTextField, which is calling the method, through the userInfo dictionary.
        let textField:NSTextField = obj.object as! NSTextField
        self.textField = textField
    }
    
    func btnClick(){
     
        if textField?.stringValue != nil {
            
            shell((textField?.stringValue)!)
//            textView?.insertText(shell((textField?.stringValue)!), replacementRange: NSRange())
        }
        
    }
    
    
   @discardableResult func shell(_ args:String...)-> (){
        let pipe = Pipe()
        let task = Process()
        task.launchPath = Bundle.main.path(forResource: "axel", ofType: nil)
        task.arguments = args
        task.launch()
        task.standardOutput = pipe
        task.waitUntilExit()
    
        print(task.terminationStatus)
    }
    
    
}
