//
//  AppDelegate.swift
//  axel-shell
//
//  Created by 张俊凯 on 2017/3/16.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

        let mainVC = MainVC()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        mainVC.view = NSView(frame:NSMakeRect(0, 0, (NSScreen.main()?.frame.size.width)!, (NSScreen.main()?.frame.size.height)!))
        mainVC.view.wantsLayer = true
        window.contentView?.addSubview(mainVC.view)
        window.makeKeyAndOrderFront(nil)

        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        
    }

    

}

