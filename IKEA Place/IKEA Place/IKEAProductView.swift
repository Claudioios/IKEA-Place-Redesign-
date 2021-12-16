//
//  IKEAProductView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 10/12/21.
//

import SwiftUI

struct IKEAProductView: View {
    
    @ObservedObject var ArrayProduct: ArrayModel
    @State private var isPresenting = false
    
    func didDismiss() {
        // Handle the dismissing action.
    }
    
    var ind: Int

    init(ind: Int, ArrayProduct: ArrayModel) {
        self.ind = ind
        self.ArrayProduct = ArrayProduct
    }
    
    var body: some View {
        HStack{
//            NavigationLink(destination: OpenProductView(ind: ind, ArrayProduct: ArrayProduct))
            
            Button(action: {isPresenting.toggle()})
            {
                Image("\(ArrayProduct.Product[ind].Image)")
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 384, height: 320)
                    .cornerRadius(15)
                    .overlay()
                    {
                        VStack{
                            
                            Spacer()
                            
                            HStack{
                                Text("\(ArrayProduct.Product[ind].Name)")
                                    .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding([.leading, .bottom], 10.0)
                                
                                Spacer()
                            }
                            
                        }
                        
                    }
                    .shadow(color: Color(.lightGray), radius: 30, x: 0.0, y: 22.0)
                    .padding()

                
            }
            .fullScreenCover(isPresented: $isPresenting, onDismiss: didDismiss){
                
                OpenProductView(ind: ind, ArrayProduct: ArrayProduct)
                
            }

        }
    }
}

