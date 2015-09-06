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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func showNotificationButtonPressed() {
        // Initialize a notification
        
        // 1 sentence.
        let message = "Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer."
        
        // 10 sentences.
//        let message = "Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer.\nDésolé, nous avons rencontré une erreur de chargement. Veuillez réessayer."

//        let message = "Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer. Désolé, nous avons rencontré une erreur de chargement. Veuillez réessayer."
        
//        let message = "Une erreur est survenue lors de la tentative de récupération de votre photo de profil Facebook, merci de bien vouloir modifier la photo de profil par défaut dans Facebook avant de pouvoir l'utiliser en tant que photo de profil dans BlaBlaBla."
        
        BannerMessageNotification.uniqueInstance.displayBannerMessageNotification(
            BannerMessageNotificationType.Error
            ,message: message
            ,isDurationUnlimited: true
//            ,isPictogramDisplayed: false
        )
    }
    
    @IBAction func dismissNotificationButtonPressed() {
        // Dismisses the notification
        BannerMessageNotification.uniqueInstance.dismissBannerMessageNotification()
    }
    
}