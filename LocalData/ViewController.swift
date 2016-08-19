//
//  ViewController.swift
//  LocalData
//
//  Created by Pivotal on 8/19/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import UIKit

struct myDefaultsKeys {
    static let keyOne = "firstStringKey"
    static let keyTwo = "secondStringKey"
}

class ViewController: UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ref : http://www.codingexplorer.com/nsuserdefaults-a-swift-introduction/
        
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController {
    @IBAction func onSaveLocal(sender:AnyObject){
        // NSUserDefaults
        // Its lost once the application is deleted from the phone.
        
        print("onSaveLocal:NSUserDefaults:  ==========")
        
        // ref : http://stackoverflow.com/questions/28628225/how-do-you-save-local-storage-data-in-a-swift-application
        
        defaults.setValue("String 1", forKey: myDefaultsKeys.keyOne)
        defaults.setValue("String 2", forKey: myDefaultsKeys.keyTwo)
        
        defaults.synchronize()
        
        print("onSaveLocal:NSUserDefaults: /==========")
    }

    @IBAction func onGetLocal(sender:AnyObject){
        //
        print("onGetLocal:NSUserDefaults:  ======== ")
        
        if let stringOne = defaults.stringForKey(myDefaultsKeys.keyOne) {
            print("keyOne:",stringOne) // Some String Value
        }
        
        if let stringTwo = defaults.stringForKey(myDefaultsKeys.keyTwo) {
            print("keyTwo:",stringTwo) // Another String Value
        }
        
        print("onGetLocal:NSUserDefaults: /======== ")
    }
    
    // Ref: Keychain for App Uninstall : https://blog.onliquid.com/persistent-device-unique-identifier-ios-keychain/
    //
    @IBAction func onKeyChainSave(sender:AnyObject){
        print("onKeyChainSave")
        // NSUUID is available from iOS 6 and up
        let a = NSUUID().UUIDString
        print(a)
    }
    @IBAction func onKeyChainGet(sender:AnyObject){
        print("onKeyChainGet")
    }
}


//
