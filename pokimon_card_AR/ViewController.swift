//
//  ViewController.swift
//  pokimon_card_AR
//
//  Created by vignesh kumar c on 27/11/23.
//

import UIKit
import SceneKit
import ARKit
import RoomPlan

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    
    lazy var captureSession: RoomCaptureSession = {
        let captureSession = RoomCaptureSession()
        sceneView.session = captureSession.arSession
        return captureSession
    }()
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
        captureSession.delegate = self
           // Configure the ARSCNView
        sceneView.delegate = self
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
       }
    
   /* let arView = ARSCNView()
    
    let session = ARSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.frame = view.bounds
        view.addSubview(arView)
        arView.session = session
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        if let sofaScene = SCNScene(named: "SOFACG.USDZ") {
            let sofaNode = sofaScene.rootNode
            
            arView.scene.rootNode.addChildNode(sofaNode)
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        session.run(configuration)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    */
 

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    @IBAction func placeBtnTapped(_ sender: Any) {
        let tapLocation = (sender as AnyObject).location(in: sceneView)
        let hitTestResults = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        if let hitResult = hitTestResults.first {
            let position = SCNVector3(hitResult.worldTransform.columns.3.x,
                                      hitResult.worldTransform.columns.3.y,
                                      hitResult.worldTransform.columns.3.z)
            placeFurniture(at: position)
        }
    }
    
    
    func placeFurniture(at position: SCNVector3) {
        // Create a furniture node (replace with your model loading logic)
        let furnitureNode = SCNNode(geometry: SCNBox(width: 0.2, height: 0.1, length: 0.2, chamferRadius: 0))

        // Set the furniture node's position (replace with your positioning logic)
        furnitureNode.position = SCNVector3(0, 0, -0.5)

        // Add the furniture node to the scene
        sceneView.scene.rootNode.addChildNode(furnitureNode)
    }
    
}



//
//extension ViewController: RoomCaptureSessionDelegate {
//    
//    func captureSession(_ session: RoomCaptureSession, didUpdate room: CapturedRoom) {
//        // Update your custom visualizer
//        visualizer?.update(room)
//    }
//    
//    func captureSession(_ session: RoomCaptureSession, didProvide instruction: RoomCaptureSession.Instruction) {
//        // Preview instruction to the user
//        visualizer?.provide(instruction)
//    }
//    
//}

extension ViewController: RoomCaptureSessionDelegate {
    
//    didupda
}
