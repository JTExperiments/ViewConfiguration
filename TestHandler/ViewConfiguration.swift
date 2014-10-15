//
//  View.swift
//  TestHandler
//
//  Created by James Tang on 14/10/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

import UIKit

class ViewConfiguration : NSObject {

    var text : String?
    var src : String?

    var color : String?
    var borderColor : String?
    var borderWidth : NSNumber?
    var cornerRadius : NSNumber?
    var backgroundColor : String?

    func computedValueForKey(key: String?, object:NSObject?) -> NSObject? {
        let pattern = SOCPattern(string: key)
        return pattern.stringFromObject(object)
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        println("key: \(key) not supported for value: \(value)")
    }
}

var ViewConfigurationHandle: UInt8 = 0

extension UIView {

    var $ : ViewConfiguration {
        get {
            var config = objc_getAssociatedObject(self, &ViewConfigurationHandle) as? ViewConfiguration
            if config == nil {
                config = ViewConfiguration()
                objc_setAssociatedObject(self, &ViewConfigurationHandle, config, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
            }
            return config!
        }
    }

    func configureWithObject(obj : NSObject?) {
        self.applyConfiguration($, object:obj)

        for view in self.subviews {
            view.configureWithObject(obj)
        }
    }

    func applyConfiguration(configuration: ViewConfiguration, object:NSObject?) {
        self.layer.borderColor = configuration.borderColor?.toColor().CGColor
        self.layer.borderWidth = CGFloat(configuration.borderWidth?.floatValue ?? 0)
        self.layer.cornerRadius = CGFloat(configuration.cornerRadius?.floatValue ?? 0)
        self.backgroundColor = configuration.backgroundColor?.toColor()
    }
}

extension UIImageView {
    override func applyConfiguration($: ViewConfiguration, object:NSObject?) {
        super.applyConfiguration($, object:object)
        var url = ($.computedValueForKey($.src, object: object) as? String)?.toURL()
        self.sd_setImageWithURL(url)
    }
}

extension UILabel {
    override func applyConfiguration($: ViewConfiguration, object:NSObject?) {
        super.applyConfiguration($, object:object)
        self.text = $.computedValueForKey($.text, object: object) as? String
    }
}
