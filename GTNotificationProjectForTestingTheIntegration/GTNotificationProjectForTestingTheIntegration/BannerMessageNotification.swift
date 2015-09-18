//
//  BannerMessageNotification.swift
//  GTNotificationProjectForTestingTheIntegration
//
//  Created by King-Wizard on 2015-09-05.
//  Copyright (c) 2015 King Wizard. All rights reserved.
//

import UIKit
import FontAwesomeKit
import GTNotification

class BannerMessageNotification: NSObject, GTNotificationDelegate {
    
    var notification: GTNotification!
    
    static let uniqueInstance = BannerMessageNotification()
    
    override init() {
        super.init()
        // Initialize a notification
        self.notification = GTNotification()
        notification.delegate = self
    }
    
    /**
    This method is a proxy used to show a banner message notification.
    
    - parameter bannerMessageNotificationType: the banner message notification's type
    - parameter message: the message to display to the user
    - parameter isDurationUnlimited: defines if the displaying duration of the banner message notification is unlimited or not
    */
    func displayBannerMessageNotification(let bannerMessageNotificationType: BannerMessageNotificationType,
        let message: String,
        let isDurationUnlimited: Bool=false,
        let isPictogramDisplayed: Bool=true) {
            // let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
            let white = UIColor(white: 1.0, alpha: 1.0),
            finalStackedIconsSize: CGFloat = 30.0,
            smallerIconSize: CGFloat = 12.0
            
            var arrayOfIcons = Array<AnyObject>()
            
            switch bannerMessageNotificationType {
            case BannerMessageNotificationType.Error:
                if isPictogramDisplayed {
                    // Set the banner notification message's image.
                    let circleIcon = FAKFontAwesome.circleThinIconWithSize(finalStackedIconsSize)
                    circleIcon.addAttribute(NSForegroundColorAttributeName, value: white)
                    let exclamationIcon = FAKFontAwesome.exclamationIconWithSize(smallerIconSize)
                    exclamationIcon.addAttribute(NSForegroundColorAttributeName, value: white)
                    arrayOfIcons.append(circleIcon)
                    arrayOfIcons.append(exclamationIcon)
                }
                // Set the banner notification message's background.
                notification.backgroundColor = UIColor.redColor()
                break
            case BannerMessageNotificationType.Valid:
                if isPictogramDisplayed {
                    // Set the banner notification message's image.
                    let circleIcon = FAKFontAwesome.circleThinIconWithSize(finalStackedIconsSize)
                    circleIcon.addAttribute(NSForegroundColorAttributeName, value: white)
                    let checkIcon = FAKFontAwesome.checkIconWithSize(smallerIconSize)
                    checkIcon.addAttribute(NSForegroundColorAttributeName, value: white)
                    arrayOfIcons.append(circleIcon)
                    arrayOfIcons.append(checkIcon)
                }
                // Set the banner notification message's background.
                notification.backgroundColor = UIColor.greenColor()
                break
            default:
                break
            }
            
            if isPictogramDisplayed {
                notification.image = UIImage(stackedIcons: arrayOfIcons, imageSize: CGSizeMake(finalStackedIconsSize, finalStackedIconsSize))
            }
            notification.tintColor = white
            notification.animation = GTNotificationAnimation.Slide
            notification.message = message
            notification.isDurationUnlimited = isDurationUnlimited
            
            // Show the notification
            GTNotificationManager.sharedInstance.showNotification(notification)
    }
    
    /**
    This method is a proxy used to dismiss the banner message notification.
    */
    func dismissBannerMessageNotification() {
        GTNotificationManager.sharedInstance.dismissCurrentNotification()
    }
    
    // MARK: GTNotificationDelegate Methods
    
    func notificationFontForMessageLabel(notification: GTNotification) -> UIFont
    {
        //        return UIFont(name: "AvenirNext-Regular", size: 15.0)!
        //        return UIFont(name: "AvenirNext-Medium", size: 15.0)!
        //        return UIFont(name: "AvenirNext-DemiBold", size: 14.0)!
        
        //        return UIFont.systemFontOfSize(15)
        
        //        return AppFonts.proximaNovaSemiBold(15.0)
        //        return AppFonts.proximaNovaBold(14.0)
        return AppFonts.proximaNovaBold(15.0)
    }
    
}