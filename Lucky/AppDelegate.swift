//
//  AppDelegate.swift
//  Lucky
//
//  Created by Peng Jingwen on 2014-20-11.
//  Copyright (c) 2014 PrettyX.org. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            sender.windows.map({
                (window: AnyObject) -> AnyObject in
                
                if window is NSWindow {
                    window.makeKeyAndOrderFront(sender)
                }
                
                return window
            })
        }
        
        return true
    }
}

