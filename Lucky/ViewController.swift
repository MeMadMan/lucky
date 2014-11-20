//
//  ViewController.swift
//  Lucky
//
//  Created by Peng Jingwen on 2014-20-11.
//  Copyright (c) 2014 PrettyX.org. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var filePath: NSTextField!
    @IBOutlet weak var result: NSTextField!
        
    var numbers: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func selectFile(sender: NSButton) {
        if let window = NSApplication.sharedApplication().windows.first as? NSWindow {
            var openPanel = NSOpenPanel()
            openPanel.allowsMultipleSelection = false
            openPanel.beginSheetModalForWindow(window, completionHandler: { (result:Int) -> Void in
                
                if result == NSOKButton {
                    if let url = openPanel.URLs.first as? NSURL {
                        
                        self.filePath.stringValue = (url.description as NSString).substringFromIndex(7)
                        
                        if let data = NSData(contentsOfURL: url) {
                            var content = NSString(data: data, encoding: NSUTF8StringEncoding)
                            self.numbers = content?.componentsSeparatedByString("\n")
                        }
                        
                    }
                }
                
            })
        }
    }

    @IBAction func rock(sender: NSButton) {
        
        if let numbers = self.numbers {
            if let result = numbers[Int(arc4random()) % numbers.count] as? NSString {
                self.result.stringValue = result
            }
        }
    }
}

