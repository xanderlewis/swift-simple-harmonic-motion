//
//  PhysicsViewController.swift
//  Simple Harmonic Motion
//
//  Created by Xander Lewis on 16/01/2017.
//  Copyright © 2017 Xander Lewis. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class PhysicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.ignoresSiblingOrder = false
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        let scene = PhysicsScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        scene.viewController = self
        skView.presentScene(scene)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func getSettings(forObjectWithName objectName: String, atPoint point: CGPoint) {
        
        // Instantiate node settings view controller and configure it
        let popupVC = storyboard?.instantiateViewController(withIdentifier: "nodesettings") as! NodeSettingsViewController
        addChildViewController(popupVC)
        popupVC.didMove(toParentViewController: self)
        
        if objectName == "body" {
            popupVC.prepareSettings(forObjectWithName: "body", atPosition: point)
        } else if objectName == "spring" {
            popupVC.prepareSettings(forObjectWithName: "spring", atPosition: point)
        }
        
        
        // Show node settings
        popupVC.view.frame = view.frame
        view.addSubview(popupVC.view!)
    }
}
