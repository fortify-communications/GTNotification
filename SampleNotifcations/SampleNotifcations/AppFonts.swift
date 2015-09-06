//
//  AppFonts.swift
//  SampleNotifcations
//
//  Created by King-Wizard on 2015-09-05.
//  Copyright (c) 2015 King Wizard. All rights reserved.
//

import UIKit
class AppFonts: NSObject {
    
    private static let proximaNovaItalicFont = UIFont(name: SampleNotificationsFontName.ProximaNovaItalic.rawValue, size: 15)!
    class func proximaNovaItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaExtraBoldItalicFont = UIFont(name: SampleNotificationsFontName.ProximaNovaExtraBoldItalic.rawValue, size: 15)!
    class func proximaNovaExtraBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaExtraBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBlackFont = UIFont(name: SampleNotificationsFontName.ProximaNovaBlack.rawValue, size: 15)!
    class func proximaNovaBlack(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBlackFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaExtraBoldFont = UIFont(name: SampleNotificationsFontName.ProximaNovaExtraBold.rawValue, size: 15)!
    class func ProximaNovaExtraBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaExtraBoldFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBoldItalicFont = UIFont(name: SampleNotificationsFontName.ProximaNovaBoldItalic.rawValue, size: 15)!
    class func proximaNovaBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaRegularFont = UIFont(name: SampleNotificationsFontName.ProximaNovaRegular.rawValue, size: 15)!
    class func proximaNovaRegular(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaRegularFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBlackItalicFont = UIFont(name: SampleNotificationsFontName.ProximaNovaBlackItalic.rawValue, size: 15)!
    class func proximaNovaBlackItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBlackItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaThinFont = UIFont(name: SampleNotificationsFontName.ProximaNovaThin.rawValue, size: 15)!
    class func proximaNovaThin(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaThinFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBoldFont = UIFont(name: SampleNotificationsFontName.ProximaNovaBold.rawValue, size: 15)!
    class func proximaNovaBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBoldFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaSemiBoldItalicFont = UIFont(name: SampleNotificationsFontName.ProximaNovaSemiBoldItalic.rawValue, size: 15)!
    class func proximaNovaSemiBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaSemiBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaSemiBoldFont = UIFont(name: SampleNotificationsFontName.ProximaNovaSemiBold.rawValue, size: 15)!
    class func proximaNovaSemiBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaSemiBoldFont.fontWithSize(fontSize)
    }
    
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
            println("\(getVaList([fontFamilyName]))")
            for fontName: String in UIFont.fontNamesForFamilyName(fontFamilyName) as! [String] {
                println("\t\(getVaList([fontName]))")
            }
        }
    }
    
}

