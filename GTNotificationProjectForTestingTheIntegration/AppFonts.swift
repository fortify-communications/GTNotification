//
//  AppFonts.swift
//  GTNotificationProjectForTestingTheIntegration
//
//  Created by King-Wizard on 2015-09-05.
//  Copyright (c) 2015 King Wizard. All rights reserved.
//

import UIKit
class AppFonts: NSObject {
    
    private static let proximaNovaItalicFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaItalic.rawValue, size: 15)!
    class func proximaNovaItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaExtraBoldItalicFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaExtraBoldItalic.rawValue, size: 15)!
    class func proximaNovaExtraBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaExtraBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBlackFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaBlack.rawValue, size: 15)!
    class func proximaNovaBlack(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBlackFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaExtraBoldFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaExtraBold.rawValue, size: 15)!
    class func ProximaNovaExtraBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaExtraBoldFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBoldItalicFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaBoldItalic.rawValue, size: 15)!
    class func proximaNovaBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaRegularFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaRegular.rawValue, size: 15)!
    class func proximaNovaRegular(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaRegularFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBlackItalicFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaBlackItalic.rawValue, size: 15)!
    class func proximaNovaBlackItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBlackItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaThinFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaThin.rawValue, size: 15)!
    class func proximaNovaThin(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaThinFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaBoldFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaBold.rawValue, size: 15)!
    class func proximaNovaBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaBoldFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaSemiBoldItalicFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaSemiBoldItalic.rawValue, size: 15)!
    class func proximaNovaSemiBoldItalic(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaSemiBoldItalicFont.fontWithSize(fontSize)
    }
    
    private static let proximaNovaSemiBoldFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.ProximaNovaSemiBold.rawValue, size: 15)!
    class func proximaNovaSemiBold(let fontSize: CGFloat) -> UIFont {
        return self.proximaNovaSemiBoldFont.fontWithSize(fontSize)
    }
    
    private static let zocialFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.Zocial.rawValue, size: 15)!
    class func zocial(let fontSize: CGFloat) -> UIFont {
        return self.zocialFont.fontWithSize(fontSize)
    }
    
    private static let fontAwesomeFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.FontAwesome.rawValue, size: 15)!
    class func fontAwesome(let fontSize: CGFloat) -> UIFont {
        return self.fontAwesomeFont.fontWithSize(fontSize)
    }
    
    private static let foundationIconsFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.FoundationIcons.rawValue, size: 15)!
    class func foundationIcons(let fontSize: CGFloat) -> UIFont {
        return self.foundationIconsFont.fontWithSize(fontSize)
    }
    
    private static let ionIconsFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.IonIcons.rawValue, size: 15)!
    class func ionIcons(let fontSize: CGFloat) -> UIFont {
        return self.ionIconsFont.fontWithSize(fontSize)
    }
    
    private static let glyphIconsFont = UIFont(name: GTNotificationProjectForTestingTheIntegrationFontName.GlyphIcons.rawValue, size: 15)!
    class func glyphIcons(let fontSize: CGFloat) -> UIFont {
        return self.glyphIconsFont.fontWithSize(fontSize)
    }
    
    /*
    Print the names of all fonts available for this app.
    */
    class func printAllFontNames() {
        for fontFamilyName: String in UIFont.familyNames() {
            print("\(getVaList([fontFamilyName]))")
            for fontName: String in UIFont.fontNamesForFamilyName(fontFamilyName) {
                print("\t\(getVaList([fontName]))")
            }
        }
    }
    
}

