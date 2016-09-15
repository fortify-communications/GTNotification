//
//  GTNotificationManager.swift
//  An in app notification banner for Swift.
//
//  Release 1.4.3
//  Solid red background + Exclamation mark symbol's image left aligned + Title left aligned + Message left aligned.
//
//  Created by Mathieu White on 2015-06-20.
//  Modified by King-Wizard
//  Copyright (c) 2015 Mathieu White. All rights reserved.
//

import UIKit

/// Identifies the position of the GTNotificationView when presented on the window
public enum GTNotificationPosition: UInt
{
    case Top
    case Bottom
}

/// Identifies the animation of the GTNotificationView when presenting
public enum GTNotificationAnimation: UInt
{
    case Fade
    case Slide
}

/**
The GTNotificationViewDelegate protocol defines an optional method to receive
user touches on objects.
*/
@objc public protocol GTNotificationViewDelegate: NSObjectProtocol
{
    /**
    Tells the delegate the notification view was tapped.
    
    - parameter notificationView: the GTNotificationView object being tapped
    */
    @objc optional func notificationViewTapped(notificationView: GTNotificationView)
}

/**
A GTNotificationView object specifies a GTNotification that can be
displayed in the app on the key window.
*/
public class GTNotificationView: UIView
{
    // MARK: - Constants
    
    /// The vertical padding of the GTNotificationView
    let verticalPadding: CGFloat = 20.0
    
    /// The horizontal padding of the GTNotificationView
    let horizontalPadding: CGFloat = 20.0
    
    /// The vertical spacing between the title and message labels
    let labelSpacing: CGFloat = 16.0
    
    // MARK: - Variables
    
    /// Identifies if the GTNotificationView is visible or not
    var isVisible: Bool = false
    
    /// The title label of the GTNotificationView
    weak var titleLabel: UILabel?
    
    /// The message label of the GTNotificationView
    weak var messageLabel: UILabel?
    
    /// The image view of the GTNotificationView
    weak var imageView: UIImageView?
    
    override public var tintColor: UIColor? {
        didSet
        {
            self.titleLabel?.textColor = tintColor
            self.messageLabel?.textColor = tintColor
            self.imageView?.tintColor = tintColor
        }
    }
    
    /// The position of the GTNotificationView
    var position: GTNotificationPosition = GTNotificationPosition.Top
    
    /// The animation of the GTNotificationView
    public var animation: GTNotificationAnimation = GTNotificationAnimation.Fade
    
    /// The height of the GTNotificationView
    var notificationViewHeight: CGFloat?
    
    /// The visual blur effect for the notification view
    var blurView: UIVisualEffectView?
    
    /// The top layout constraint of the GTNotificationView
    var topConstraint: NSLayoutConstraint?
    
    /// The bottom layout constraint of the GTNotificationView
    var bottomConstraint: NSLayoutConstraint?
    
    /// The tap gesture that fires the action of the notification
    var tapGesture: UITapGestureRecognizer?
    
    /// The delegate of the GTNotificationView
    public weak var delegate: GTNotificationViewDelegate?
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.initNotificationView()
    }
    
    
    convenience init()
    {
        self.init(frame: CGRect.zero)
    }
    
    
    func initNotificationView()
    {
        // Set the default properties of the GTNotificationView
        self.backgroundColor = UIColor.clear
        self.alpha = 1.0
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialize the title label for the notification view
        //        let titleLabel: UILabel = UILabel()
        //        titleLabel.font = UIFont.systemFontOfSize(16.0)
        //        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Initialize the message label for the notification view
        let messageLabel: UILabel = UILabel()
        messageLabel.font = UIFont.systemFont(ofSize: 13.0)
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialize the image view for the notification view
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialize the tap gesture
        //        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("notificationTapped"))
        //        self.addGestureRecognizer(tapGesture)
        
        // Add the labels to the notification view
        //        self.addSubview(titleLabel)
        self.addSubview(messageLabel)
        self.addSubview(imageView)
        
        // Set each label to their variable
        //        self.titleLabel = titleLabel
        //        titleLabel.textAlignment = NSTextAlignment.Center
        
        self.messageLabel = messageLabel
        self.messageLabel!.textAlignment = NSTextAlignment.center
        
        self.imageView = imageView
        //        self.tapGesture = tapGesture
    }
    
    
    // MARK: - Auto Layout
    
    /**
    This method will setup the constraints for the notification view.
    */
    func setupConstraints()
    {
        if (self.blurView != nil)
        {
            // Layout the blur view vertically
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[_blur]|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: ["_blur" : self.blurView!]))
            
            // Layout the blur view horizontally
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[_blur]|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: ["_blur" : self.blurView!]))
        }
        
        if (self.imageView?.image != nil)
        {
            // Image Center Y
            self.addConstraint(NSLayoutConstraint(item: self.imageView!,
                attribute: NSLayoutAttribute.centerY,
                relatedBy: NSLayoutRelation.equal,
                toItem: self,
                attribute: NSLayoutAttribute.centerY,
                multiplier: 1.0,
                constant: 0.0))
            
            // Image Left
            self.addConstraint(NSLayoutConstraint(item: self.imageView!,
                attribute: NSLayoutAttribute.left,
                relatedBy: NSLayoutRelation.equal,
                toItem: self,
                attribute: NSLayoutAttribute.left,
                multiplier: 1.0,
                constant: self.horizontalPadding))
            
            // Image Width
            self.addConstraint(NSLayoutConstraint(item: self.imageView!,
                attribute: NSLayoutAttribute.width,
                relatedBy: NSLayoutRelation.equal,
                toItem: nil,
                attribute: NSLayoutAttribute.notAnAttribute,
                multiplier: 1.0,
                constant: 36.0))
            
            // Image Height
            self.addConstraint(NSLayoutConstraint(item: self.imageView!,
                attribute: NSLayoutAttribute.height,
                relatedBy: NSLayoutRelation.equal,
                toItem: nil,
                attribute: NSLayoutAttribute.notAnAttribute,
                multiplier: 1.0,
                constant: 36.0))
        }
        
        
        //        // Title Label Top
        //        self.addConstraint(NSLayoutConstraint(item: self.titleLabel!,
        //            attribute: NSLayoutAttribute.Top,
        //            relatedBy: NSLayoutRelation.Equal,
        //            toItem: self,
        //            attribute: NSLayoutAttribute.Top,
        //            multiplier: 1.0,
        //            constant: self.verticalPadding))
        //
        //        // Title Label Left
        //        self.addConstraint(NSLayoutConstraint(item: self.titleLabel!,
        //            attribute: NSLayoutAttribute.Left,
        //            relatedBy: NSLayoutRelation.Equal,
        //            toItem: (self.imageView?.image == nil) ? self : self.imageView!,
        //            attribute: (self.imageView?.image == nil) ? NSLayoutAttribute.Left : NSLayoutAttribute.Right,
        //            multiplier: 1.0,
        //            constant: self.horizontalPadding))
        //
        //        // Title Label Right
        //        self.addConstraint(NSLayoutConstraint(item: self.titleLabel!,
        //            attribute: NSLayoutAttribute.Right,
        //            relatedBy: NSLayoutRelation.Equal,
        //            toItem: self,
        //            attribute: NSLayoutAttribute.Right,
        //            multiplier: 1.0,
        //            constant: -self.horizontalPadding))
        
        
        // Message Label Top
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel!,
            attribute: NSLayoutAttribute.top,
            relatedBy: NSLayoutRelation.equal,
//            toItem: self.titleLabel!,
            toItem: self,
//            attribute: NSLayoutAttribute.Baseline,
            attribute: NSLayoutAttribute.top,
            multiplier: 1.0,
            constant: 0.0
        ))
        
        // Message Label Left
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel!,
            attribute: NSLayoutAttribute.left,
            relatedBy: NSLayoutRelation.equal,
//            toItem: self.titleLabel!,
//            attribute: NSLayoutAttribute.Left,
            toItem: self.imageView!,
            attribute: NSLayoutAttribute.right,
            multiplier: 1.0,
//            constant: 0.0
            constant: 10.0
        ))
        
        // Message Label Right
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel!,
            attribute: NSLayoutAttribute.right,
            relatedBy: NSLayoutRelation.equal,
//            toItem: self.titleLabel!,
            toItem: self,
            attribute: NSLayoutAttribute.right,
            multiplier: 1.0,
//            constant: 0.0
            constant: -self.verticalPadding - 10
        ))
        
        // Message Label Bottom
        self.addConstraint(NSLayoutConstraint(item: self.messageLabel!,
            attribute: NSLayoutAttribute.bottom,
            relatedBy: NSLayoutRelation.equal,
            toItem: self,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1.0,
//            constant: -self.verticalPadding
            constant: 0.0
        ))
    }
    
    /**
    This method will layout the notification view and add it to the key window of the application.
    */
    func layoutNotificationViewInWindow()
    {
        // Get a reference of the application window
        let window: UIWindow? = UIApplication.shared.keyWindow
        
        // The application has a key window
        if let window = window
        {
            // Add the notification view to the window
            window.addSubview(self)
            
            // Calculate the height of the notification view
            self.notificationViewHeight = self.heightForNoticationView()
            
            // Views Dictionary
            var viewsDict = [String : AnyObject]()
            viewsDict["_view"] = self
            
            // Metrics Dictionary
            var metricsDict = [String : AnyObject]()
            metricsDict["_h"] = self.notificationViewHeight as AnyObject?
            
            // Notification View Width
            let notificationHorizontalConstraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "H:|[_view]|",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: metricsDict,
                views: viewsDict)
            
            // Notification View Height
            let notificationVerticalConstraints: [NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: "V:[_view(_h)]",
                options: NSLayoutFormatOptions(rawValue: 0),
                metrics: metricsDict,
                views: viewsDict)
            
            // Notification View Top
            if (self.position == GTNotificationPosition.Top)
            {
                var topConstant: CGFloat = 0.0
                
                if (self.animation == GTNotificationAnimation.Slide)
                {
                    topConstant = -self.notificationViewHeight!
                }
                
                let topConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: window,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: topConstant)
                
                window.addConstraint(topConstraint)
                self.topConstraint = topConstraint
            }
            
            // Notification View Bottom
            if (self.position == GTNotificationPosition.Bottom)
            {
                var bottomConstant: CGFloat = 0.0
                
                if (self.animation == GTNotificationAnimation.Slide)
                {
                    bottomConstant = self.notificationViewHeight!
                }
                
                let bottomConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: window,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: bottomConstant)
                
                window.addConstraint(bottomConstraint)
                self.bottomConstraint = bottomConstraint
            }
            
            // Add the constraints to the window
            window.addConstraints(notificationVerticalConstraints)
            window.addConstraints(notificationHorizontalConstraints)
            
            // Layout the notification view
            self.layoutIfNeeded()
            self.titleLabel?.layoutIfNeeded()
            self.messageLabel?.layoutIfNeeded()
        }
        else
        {
            // No key window found
            assertionFailure("Warning: make sure to call makeKeyAndVisible on the application's window.")
        }
    }
    
    // MARK: - Instance Methods
    
    /**
    This method calculates and returns the height for the notification view.
    
    - returns: the height of the notification view
    */
    func heightForNoticationView() -> CGFloat {
        // Determine the maximum with of our labels
        let maximumLabelWidth: CGFloat = UIScreen.main.bounds.width - (self.horizontalPadding * 2.0)
        
        // Initialize our maximum label size
        let maximumLabelSize = CGSize(width: maximumLabelWidth, height: CGFloat.greatestFiniteMagnitude)
        
        // Get the height of the title label
        //        let titleLabelHeight: CGFloat = (self.titleLabel!.text! as NSString).boundingRectWithSize(maximumLabelSize,
        //            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
        //            attributes: [NSFontAttributeName : self.titleLabel!.font],
        //            context: nil).height
        
        // Get the height of the message label
        let messageLabelHeight: CGFloat = (self.messageLabel!.text! as NSString).boundingRect(with: maximumLabelSize,
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSFontAttributeName : self.messageLabel!.font],
            context: nil).height
        
        // Return the total height, (vertical top and bottom padding + label heights + label spacing)
        //        return self.verticalPadding * 2.0 + titleLabelHeight + messageLabelHeight + self.labelSpacing
        return self.verticalPadding * 2.0 + messageLabelHeight + self.labelSpacing
    }
    
    /**
    This method applies the notification view's visual attributes.
    
    - parameter notification: the notification that will be displayed
    */
    func prepareForNotification(notification: GTNotification)
    {
        self.tintColor = notification.tintColor
        //        self.titleLabel?.text = notification.title
        self.messageLabel?.text = notification.message
        self.imageView?.image = notification.image
        self.position = notification.position
        self.animation = notification.animation
        
        // Get the font for the title label
        if (notification.delegate?.responds(to: Selector("notificationFontForTitleLabel:")) == true)
        {
            self.titleLabel?.font = notification.delegate!.notificationFontForTitleLabel!(notification: notification)
        }
        
        // Get the font for the message label
        if (notification.delegate?.responds(to: Selector("notificationFontForMessageLabel:")) == true)
        {
            self.messageLabel?.font = notification.delegate!.notificationFontForMessageLabel!(notification: notification)
        }
        
        if (notification.blurEnabled == true)
        {
            self.backgroundColor = UIColor.clear
            
            // Add the blur effect to the notification view
            let blurEffect: UIBlurEffect = UIBlurEffect(style: notification.blurEffectStyle!)
            let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
            blurView.translatesAutoresizingMaskIntoConstraints = false
            self.insertSubview(blurView, at: 0)
            self.blurView = blurView
        }
        else
        {
            self.backgroundColor = notification.backgroundColor
        }
        
        // Set the initial alpha to 0.0 for the fade animation
        if (self.animation == GTNotificationAnimation.Fade)
        {
            self.alpha = 0.0
        }
        else
        {
            //            self.alpha = 1.0
            self.alpha = 0.95
        }
        
        // Layout the view's subviews
        self.setupConstraints()
        
        // Layout the view in the window
        self.layoutNotificationViewInWindow()
    }
    
    /**
    This method animates the notification view on the application's window
    
    - parameter show:         true if the notification view will dismiss, false otherwise
    - parameter completion:   the completion closure to execute after the animation
    */
    func animateNotification(willShow show: Bool, completion: @escaping (_ finished: Bool) -> Void)
    {
        // Set the animation view's visibility
        self.isVisible = show
        
        // The notification view should animate with a fade
        if (self.animation == GTNotificationAnimation.Fade)
        {
            UIView.animate(withDuration: 0.4,
                animations: {
                    self.alpha = (show == true) ? 1.0 : 0.0
                },
                completion: { (finished) -> Void in
                    completion(finished)
            })
        }
        
        // The notification view should animate with a slide
        if (self.animation == GTNotificationAnimation.Slide)
        {
            if (self.position == GTNotificationPosition.Top)
            {
                self.topConstraint?.constant = (show == true) ? 0.0 : -self.notificationViewHeight!
            }
            else
            {
                self.bottomConstraint?.constant = (show == true) ? 0.0 : self.notificationViewHeight!
            }
            
            UIView.animate(withDuration: 0.4,
                animations: {
                    self.layoutIfNeeded()
                },
                completion: {(finished) -> Void in
                    completion(finished)
            })
        }
    }
    
    // MARK: - Gesture Recognizer Methods
    
    /**
    This method fires when the notification view is tapped.
    
    NOTE: Tapping the notification view will dismiss it immediately.
    */
    @objc private func notificationTapped()
    {
        // Notify the delegate that the notification view was tapped
        if (self.delegate?.responds(to: Selector("notificationViewTapped:")) == true)
        {
            self.delegate!.notificationViewTapped!(notificationView: self)
        }
    }
}

public class GTNotificationManager: NSObject, GTNotificationViewDelegate
{
    // MARK: - Variables
    
    /// The singleton instance of the GTNotificationManager
    public static var sharedInstance: GTNotificationManager = GTNotificationManager()
    
    /// The private array of notifications queued for display
    private var mutableNotifications: [GTNotification] = []
    
    /// The current notification view being displayed
    private var currentNotificationView: GTNotificationView?
    
    /// The timer that fires the scheduled dismissal of the notification
    private var dismissalTimer: Timer?
    
    // MARK: - Read Only
    
    /// The array of notifications queued for display
    internal var notifications: [GTNotification] {
        get {
            let immutableNotifications = self.mutableNotifications
            return immutableNotifications
        }
    }
    
    // MARK: - Initializers
    
    override init()
    {
        super.init()
    }
    
    // MARK: - Instance Methods
    
    /**
    This method shows the notification on the application's window.
    
    - parameter notification: the notification to display
    */
    public func showNotification(notification: GTNotification)
    {
        // Only show one notification at a time
        if (self.currentNotificationView == nil)
        {
            // Queue the notification for display
            self.mutableNotifications.append(notification)
            
            // Initialize a GTNotificationView
            let notificationView: GTNotificationView = GTNotificationView()
            notificationView.delegate = self
            
            // Prepare the view for the notification to display
            notificationView.prepareForNotification(notification: notification)
            
            // Animate the notification
            notificationView.animateNotification(willShow: true, completion: {(finished: Bool) -> Void in
                
                if !notification.isDurationUnlimited {
                    // Schedule the notification view's dismissal
                    self.dismissalTimer = Timer.scheduledTimer(timeInterval: notification.duration,
                        target: self,
                        selector: Selector("dismissCurrentNotification:"),
                        userInfo: notification,
                        repeats: false)
                }
                
            })
            
            // Set the current notification
            self.currentNotificationView = notificationView
        }
    }
    
    /**
    This method dismissed the current notification on the application's window.
    */
    @objc private func dismissCurrentNotification(timer: Timer?)
    {
        let notification: GTNotification? = timer?.userInfo as? GTNotification
        
        self.dismissalTimer?.invalidate()
        self.dismissalTimer = nil
        
        if let notificationView = self.currentNotificationView
        {
            // Animate the notification
            notificationView.animateNotification(willShow: false, completion: {(finished: Bool) -> Void in
                
                // Notify the delegate of the notification's dismissal
                if let notification = notification
                {
                    if (notification.delegate?.responds(to: Selector("notificationDidDismiss:")) == true)
                    {
                        notification.delegate!.notificationDidDismiss!(notification: notification)
                    }
                }
                
                notificationView.removeFromSuperview()
                self.currentNotificationView = nil
                
            })
        }
    }
    
    /**
        This method dismissed the current notification on the application's window.
        Custom method added by King Wizard.
    */
    public func dismissCurrentNotification()
    {
        if let notificationView = self.currentNotificationView
        {
            // Animate the notification
            notificationView.animateNotification(willShow: false, completion: {
                (finished: Bool) -> Void in
                
                notificationView.removeFromSuperview()
                self.currentNotificationView = nil
                
            })
        }
    }
    
    // MARK: - GTNotificationViewDelegate Methods
    
    @objc public func notificationViewTapped(notificationView: GTNotificationView)
    {
        let notification = self.mutableNotifications.remove(at: 0)
        
        self.dismissCurrentNotification(timer: nil)
        
        if  let target = notification.target,
            let action = notification.action
        {
            if (target.responds(to: action) == true)
            {
                DispatchQueue.main.async {
                    Thread.detachNewThreadSelector(action, toTarget: target, with: nil)
                }
            }
        }
    }
}
