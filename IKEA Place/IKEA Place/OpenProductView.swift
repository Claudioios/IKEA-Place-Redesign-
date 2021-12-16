//
//  OpenProductView.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 10/12/21.
//

import SwiftUI

struct OpenProductView: View {
    
    @ObservedObject var ArrayProduct: ArrayModel
    @State private var isPresenting = false

    var ind: Int

    
    func didDismiss() {
        // Handle the dismissing action.
    }
    
    init(ind: Int, ArrayProduct: ArrayModel) {
        self.ind = ind
        self.ArrayProduct = ArrayProduct
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var xBack : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//            Image(systemName: "x.circle.fill") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.gray)
//
//
//            }
//        }
//    }
    var body: some View {
        ScrollView{
        VStack{
            Image("\(ArrayProduct.Product[ind].Image)")
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: 414, height: 605)
//                .padding()
            HStack{
                Text("\(ArrayProduct.Product[ind].Name)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                .foregroundColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
                .padding(.leading, 15.0)
            Spacer()
                if (ArrayProduct.Product[ind].IsFavourite == false)
                {
                    Button(action: {
                        ArrayProduct.Product[ind].IsFavourite.toggle()
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
                            .padding(.trailing,15.0)
                    }
                    
                    
                }
                else
                {
                    Button(action: {
                        ArrayProduct.Product[ind].IsFavourite.toggle()
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
                            .padding(.trailing,15.0)
                    }
                    
                    
                    
                }

            }
            HStack{
            Text("\(ArrayProduct.Product[ind].ProductType)")
                    .font(.title2)
                    .fontWeight(.regular)
                    .padding(.leading, 15.0)
                Spacer()
            }
            HStack{
            Text("\(ArrayProduct.Product[ind].ProductPrice) €")
                    .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .padding(.leading, 15.0)
                Spacer()
            }
            HStack{
                Text("Product Code: ")
                    .font(.title3)
                    .fontWeight(.regular)
                    .padding(.leading, 15.0)
                Spacer()
                Rectangle()
                    .frame(width: 150, height: 35)
                    .foregroundColor(Color(.lightGray))
                    .cornerRadius(5)
                    .overlay()
                    {
                        Text("\(ArrayProduct.Product[ind].ProductCode)")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 15.0)

                    
            }
            Spacer()
        }
            Divider()
        
            HStack{
            Text("Explore the collection")
            .font(.title2)
            .fontWeight(.regular)
            .padding(.leading, 15.0)
                Spacer()
            }
            
            HStack{
                Rectangle()
                .frame(height: 250)
                .padding(.horizontal, 15.0)

            }
            
            Divider()
            HStack{
            Text("You might also like")
                    .font(.title2)
            .fontWeight(.regular)
            .padding(.leading, 15.0)
                Spacer()
            }
            
            ScrollView(.horizontal){
                HStack{
                    Rectangle()
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .frame(width: 100, height: 100)
                }
                    .padding()
                }
            
            
        }
        .overlay(){
            VStack{
                HStack{
                    Spacer()
                        Circle()
                        .foregroundColor(Color.white.opacity(0.0))
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        .padding()
                        .overlay()
                    {
                        Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                    Image(systemName: "x.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color(.lightGray))
                                        .padding()
                                        
                        
                        
                                    }
                                }
                    }

                    
                }


                Spacer()
                
//                HStack{
//
//                    Spacer()
//                    NavigationLink(destination: ARViewContainer(ind: ArrayProduct.Product[ind].ARModel) .edgesIgnoringSafeArea(.all)
//                                    .statusBar(hidden: true))
//                    {
//                    Circle()
//                        .frame(width: 80, height: 80)
//                        .foregroundColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
//                        .padding()
//                        .overlay()
//                    {
//                        Image(systemName: "arkit")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 35, height: 35)
//                            .foregroundColor(Color.white)
//
//                    }
//                    }
//                }
                
                HStack{
                    Spacer()
                    Button(action: {isPresenting.toggle()}) {
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(red: 0 / 255, green: 88 / 255, blue: 162 / 255))
                            .padding()
                            .overlay()
                        {
                            Image(systemName: "arkit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(Color.white)
                            
                        }
                    }
                    .fullScreenCover(isPresented: $isPresenting, onDismiss: didDismiss){
                        ARViewContainer(ind: ArrayProduct.Product[ind].ARModel) .edgesIgnoringSafeArea(.all)
                            .statusBar(hidden: true)
                            .overlay(){
                                VStack{
                                    HStack{
                                        Spacer()
                                            Circle()
                                            .foregroundColor(Color.white.opacity(0.0))
                                            .frame(width: 80, height: 80)
                                            .scaledToFit()
                                            .padding()
                                            .overlay()
                                        {
                                            Button(action: {
                                                isPresenting.toggle()
                                                    }) {
                                                        HStack {
                                                        Image(systemName: "x.circle.fill")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 30, height: 30)
                                                            .foregroundColor(Color(.lightGray))
                                                            .padding()
                                                            
                                            
                                            
                                                        }
                                                    }
                                        }

                                        
                                    }
                                    Spacer()
                                }
                                .ignoresSafeArea(.all)

                                
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Done")
            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: xBack)
            

        }
        .ignoresSafeArea(.all)
        .statusBar(hidden: true)

    }
}


