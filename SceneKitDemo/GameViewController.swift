//
//  GameViewController.swift
//  SceneKitDemo
//
//  Created by Robert "Skipper" Gonzalez on 6/30/17.
//  Copyright © 2017 Robert "Skipper" Gonzalez. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
//    
//    func sceneSetup() {
//        // 1
//        let scene = SCNScene()
//        
//        // 2
//        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
//        let boxNode = SCNNode(geometry: boxGeometry)
//        scene.rootNode.addChildNode(boxNode)
//        
//        // 3
//        sceneView.scene = scene
//    }
//
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(/*named: "art.scnassets/ship.scn"*/)//!
        
        
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green//UIImage(named: "g")
        greenMaterial.locksAmbientWithDiffuse = true
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.red//UIImage(named: "r")
        redMaterial.locksAmbientWithDiffuse = true
        
        
        let blueMaterial  = SCNMaterial()
        blueMaterial.diffuse.contents = UIColor.blue//UIImage(named: "b")
        blueMaterial.locksAmbientWithDiffuse = true
        
        
        let yellowMaterial = SCNMaterial()
        yellowMaterial.diffuse.contents = UIColor.yellow//UIImage(named: "y")
        yellowMaterial.locksAmbientWithDiffuse = true
        
        
        let purpleMaterial = SCNMaterial()
        purpleMaterial.diffuse.contents = UIColor.purple//UIImage(named: "p")
        purpleMaterial.locksAmbientWithDiffuse = true
        
        
        let whiteMaterial = SCNMaterial()
        whiteMaterial.diffuse.contents = UIColor.white//UIImage(named: "w")
        whiteMaterial.locksAmbientWithDiffuse   = true
        
        let lightGreyMaterial = SCNMaterial()
        lightGreyMaterial.diffuse.contents = UIColor.lightGray
        lightGreyMaterial.locksAmbientWithDiffuse   = true
        

        //boxGeometry.firstMaterial?.diffuse.contents = UIColor.red

        
        let sideLen:CGFloat = 10.0
        
        let sideLen1:Float = Float(sideLen)
        
        let boxGeometry = SCNBox(width: sideLen, height: sideLen, length: sideLen, chamferRadius: 0.0)
        
        
        
        
//        boxGeometry.materials = [greenMaterial, redMaterial, blueMaterial, yellowMaterial, purpleMaterial, whiteMaterial]
        
        boxGeometry.materials = [greenMaterial]
        
        
        
        let boxNode = SCNNode(geometry: boxGeometry)
        
        
        
        boxNode.position = SCNVector3(x:0, y:0, z:-20)
        
        
        
       
        let decrease:CGFloat = 1.0
        
        let faceDim:CGFloat = 0.5
        
        
        let zFaceGeometry = SCNBox(width: sideLen-decrease, height: sideLen-decrease, length: faceDim, chamferRadius: 0.0)
        
        let xFaceGeometry = SCNBox(width: faceDim, height: sideLen-decrease, length: sideLen-decrease, chamferRadius: 0.0)
        
        let yFaceGeometry = SCNBox(width: sideLen-decrease, height: faceDim, length: sideLen-decrease, chamferRadius: 0.0)
        
        
//        zFaceGeometry.materials = 
//        xFaceGeometry.materials =
//        yFaceGeometry.materials =
        
        
        let zFacePos = SCNNode(geometry: zFaceGeometry)
        let zFaceNeg = SCNNode(geometry: zFaceGeometry)
        
        let xFacePos = SCNNode(geometry: xFaceGeometry)
        let xFaceNeg = SCNNode(geometry: xFaceGeometry)
        
        let yFacePos = SCNNode(geometry: yFaceGeometry)
        let yFaceNeg = SCNNode(geometry: yFaceGeometry)
    
        
        
        
        zFacePos.position = SCNVector3(x:0, y:0, z:sideLen1/2.0)
        zFaceNeg.position = SCNVector3(x:0, y:0, z:-sideLen1/2.0)
        
        xFacePos.position = SCNVector3(x:sideLen1/2.0, y:0, z:0)
        xFaceNeg.position = SCNVector3(x:-sideLen1/2.0, y:0, z:0)
        
        
        yFacePos.position = SCNVector3(x:0, y:sideLen1/2.0, z:0)
        yFaceNeg.position = SCNVector3(x:0, y:-sideLen1/2.0, z:0)
        
        
        boxNode.addChildNode(zFacePos)
        boxNode.addChildNode(zFaceNeg)
        boxNode.addChildNode(xFacePos)
        boxNode.addChildNode(xFaceNeg)
        boxNode.addChildNode(yFacePos)
        boxNode.addChildNode(yFaceNeg)
        
        
        
        let itemNode = SCNNode()
        
        

        itemNode.addChildNode(boxNode)
        
        
        
        scene.rootNode.addChildNode(itemNode)
        
        
        scene.rootNode.name = "base"
        
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.white
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the ship node
//        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        
        // animate the 3d object
//        ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0.5, z: 0, duration: 1)))
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
    }
    
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        // check that we clicked on at least one object
        if hitResults.count > 0  {
            // retrieved the first clicked object
            let result: AnyObject = hitResults[0]
            
            //let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.purple, UIColor.white]
            
            
            
            
            // get its material
            //let material = result.node!.geometry!.materials[result.geometryIndex]
            
//            var newIndex:Int = Int(arc4random_uniform(6))
//            
//            
//            
//            
//            let newMaterial = SCNMaterial()
//            newMaterial.diffuse.contents = colors[newIndex]
//            newMaterial.locksAmbientWithDiffuse = true
//            
//            
//            
//            while newMaterial.diffuse.contents as! UIColor == material.diffuse.contents as! UIColor {
//                newIndex = Int(arc4random_uniform(6))
//                newMaterial.diffuse.contents = colors[newIndex]
//            }
            
            
            
            // rotate it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0
            
            
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0
                
                
                //result.node!.runAction(SCNAction.rotateBy(x: 3.14/2.0, y: 0, z: 0, duration: 1))
        
                SCNTransaction.commit()
            }
            
            
            if result.node!.isEqual(<#T##object: Any?##Any?#>)
            if result.node!.name =
            
            result.node!.removeFromParentNode()
            
            
            
            
            //material.diffuse.contents = newMaterial.diffuse.contents
        
            //result.node!.runAction(SCNAction.rotateBy(x: 0, y: 3.14/2.0, z: 0, duration: 1))
            
            //material.emission.contents = UIColor.red
            
            SCNTransaction.commit()
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
