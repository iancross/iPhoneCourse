//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by crossibc on 7/9/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "angry": FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile)
    ]
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController
        if let navCon = destinationVC as? UINavigationController{
            destinationVC = navCon.visibleViewController ?? destinationVC
        }
        if let faceVC = destinationVC as? FaceViewController {
            if let identifier = segue.identifier {
                if let expression = emotionalFaces[identifier] {
                    faceVC.expression = expression
                    if let sendingButton = sender as? UIButton {
                        faceVC.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }
}
