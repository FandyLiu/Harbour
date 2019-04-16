//
//  SelfAware.swift
//  Harbour
//
//  Created by fandylau on 2019/4/15.
//  Copyright © 2019 刘欢. All rights reserved.
//

import UIKit

protocol SelfAware: class {
    static func awake()
}

protocol SelfAware2: class {
    static func awake() -> [Selector]
}

class NothingToSeeHere {
    static func harmlessFunction() {
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        for index in 0 ..< typeCount {
            (types[index] as? SelfAware.Type)?.awake()
//            if let a = types[index] as? SelfAware2.Type {
//                let response = a.awake()
//                for o in response {
//                    let originalSelector = o
//                    let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
//                    swizzlingForClass(a.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
//                }
//
//            }
        
        }
        types.deinitialize(count: typeCount)
        types.deallocate()
    }
    
//    @objc func swizzled_viewWillAppear(_ animated: Bool) {
//        swizzled_viewWillAppear(animated)
//        print("swizzled_viewWillAppear")
//    }
//
//    private static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
//        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
//
//        guard (originalMethod != nil && swizzledMethod != nil) else {
//            return
//        }
//
//        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
//            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
//        } else {
//            method_exchangeImplementations(originalMethod!, swizzledMethod!)
//        }
//    }
//
}

extension UIViewController: SelfAware {
    static func awake() {
        UIViewController.classInit()
    }
    
    static func classInit() {
        swizzleMethod
    }
    
    @objc func swizzled_viewWillAppear(_ animated: Bool) {
        print("***")
        print(#function)
        print("***")
        let s = Selector("swizzled_viewWillAppear(_:)")
        self.perform(s)
//        swizzled_viewWillAppear(acc: nil)
        print("swizzled_viewWillAppear")
    }
    
    private static let swizzleMethod: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    
    private static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        
        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
    
}

extension UIApplication {
    private static let runOnce: Void = {
        NothingToSeeHere.harmlessFunction()
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}
extension UIApplication {

    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}
