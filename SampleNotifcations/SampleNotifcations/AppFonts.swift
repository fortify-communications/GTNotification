//
//  AppFonts.swift
//  SampleNotifcations
//
//  Created by King-Wizard on 2015-09-05.
//  Copyright (c) 2015 King Wizard. All rights reserved.
//

import UIKit

class AppFonts: NSObject {
    
    private static let zocialFont = UIFont(name: SampleNotificationsFontName.Zocial.rawValue, size: 15)!
    class func zocial(let fontSize: CGFloat) -> UIFont {
        return self.zocialFont.fontWithSize(fontSize)
    }
    
    private static let fontAwesomeFont = UIFont(name: SampleNotificationsFontName.FontAwesome.rawValue, size: 15)!
    class func fontAwesome(let fontSize: CGFloat) -> UIFont {
        return self.fontAwesomeFont.fontWithSize(fontSize)
    }
    
    private static let foundationIconsFont = UIFont(name: SampleNotificationsFontName.FoundationIcons.rawValue, size: 15)!
    class func foundationIcons(let fontSize: CGFloat) -> UIFont {
        return self.foundationIconsFont.fontWithSize(fontSize)
    }
    
    private static let ionIconsFont = UIFont(name: SampleNotificationsFontName.IonIcons.rawValue, size: 15)!
    class func ionIcons(let fontSize: CGFloat) -> UIFont {
        return self.ionIconsFont.fontWithSize(fontSize)
    }
    
    private static let glyphIconsFont = UIFont(name: SampleNotificationsFontName.GlyphIcons.rawValue, size: 15)!
    class func glyphIcons(let fontSize: CGFloat) -> UIFont {
        return self.glyphIconsFont.fontWithSize(fontSize)
    }
    
    /*
    Print the names of all fonts available for this app.
    */
    class func printAllFontNames() {
        for fontFamilyName: String in UIFont.familyNames() as! [String] {
            println("%@", getVaList([fontFamilyName]))
            for fontName: String in UIFont.fontNamesForFamilyName(fontFamilyName) as! [String] {
                println("\t%@", getVaList([fontName]))
            }
        }
    }
    
}
