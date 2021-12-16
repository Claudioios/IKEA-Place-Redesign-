//
//  ContentView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 07/12/21.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ContentView : View {
    
    @StateObject var ArrayProduct = ArrayModel()
    @State private var showingML = false
    @State private var showingProfile = false

    var body: some View {
        
        NavigationView{
        CollectionView(ArrayProduct: ArrayProduct)
                .navigationTitle("Collections")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        
//                        NavigationLink(destination: MachineLearningView())
//                        {
//                            Text("\(Image(systemName: "viewfinder"))")
//                        }
                        
                        Button("\(Image(systemName: "viewfinder"))") {
                            showingML.toggle()
                        }
                        .sheet(isPresented: $showingML) {
                            MachineLearningView()
                        }
                    
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {

//                            NavigationLink(destination: ProfileView())
//                            {
//                                Text("\(Image(systemName: "person"))")
//                            }
                        Button("\(Image(systemName: "person"))") {
                            showingProfile.toggle()
                        }
                        .sheet(isPresented: $showingProfile) {
                            ProfileView()
                        }
                        
                    }
                }
        }
        .accentColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
        


    }
}

struct ARViewContainer: UIViewRepresentable {
   
    var ind: Int
    
    func makeUIView(context: Context) -> ARView {

        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            
        
        let arView = ARView(frame: .zero)
            
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        // Handle ARSession events via delegate
       context.coordinator.view = arView
       session.delegate = context.coordinator
        
        // Handle taps
        arView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        let ArrayModel: [Entity] = [try! Experience.loadKallax(),try! Experience.loadPoang(), try! Experience.loadEktorp(), try! Experience.loadLisabo(), try! Experience.loadHektar()]
                
        arView.scene.anchors.append(ArrayModel[ind] as! HasAnchoring)
        
        return arView
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
   
        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            print(focusEntity.position)
            // Create a new anchor to add content to
            let anchor = AnchorEntity(plane: .any  )
            view.scene.anchors.append(anchor)

            // Add a Box entity with a blue material
//            let diceEntity = try! ModelEntity.loadModel(named: "LISABO")
//            diceEntity.scale = [0.3, 0.3, 0.3]
//            diceEntity.position = focusEntity.position

//            anchor.addChild(diceEntity)
        }
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


