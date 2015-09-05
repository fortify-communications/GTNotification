//
//  ViewController.swift
//  SampleNotifcations
//
//  Created by Mathieu White on 2015-06-21.
//  Modified by King-Wizard
//  Copyright (c) 2015 Mathieu White. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showNotificationButtonPressed() {
        // Initialize a notification
        
        let message = "Désolé, nous avons rencontré une\nerreur de chargement. Veuillez\nréessayer."
        
//        BannerMessageNotification.uniqueInstance.displayBannerMessageNotification(BannerMessageNotificationType.Error,
//                                                                                  message: message)
    
        BannerMessageNotification.uniqueInstance.displayBannerMessageNotification(BannerMessageNotificationType.Error,
                                                                                  message: message,
                                                                                  isDurationUnlimited: true)
    }
    
    @IBAction func dismissNotificationButtonPressed() {
        // Dismisses the notification
        BannerMessageNotification.uniqueInstance.dismissBannerMessageNotification()
    }
    
}