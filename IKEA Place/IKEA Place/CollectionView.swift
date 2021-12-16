//
//  CollectionView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 07/12/21.
//

import SwiftUI
import RealityKit

struct CollectionView : View {
    
    @ObservedObject var ArrayProduct: ArrayModel

    
    var body: some View {
        ScrollView{
        VStack{
            ForEach(0..<ArrayProduct.Product.count) { ind in
                IKEAProductView(ind: ind, ArrayProduct: ArrayProduct)
            }
        }
            
        }
        .preferredColorScheme(.light)


        
    }
}


