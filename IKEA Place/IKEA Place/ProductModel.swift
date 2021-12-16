//
//  ProductModel.swift
//  IKEA Place
//
//  Created by Claudio Silvestri on 13/12/21.
//
import SwiftUI

struct ProductModel {
    
    internal init(Name: String, Image: String, ProductType: String, ProductPrice: Int, ProductCode: String, IsFavourite: Bool, ARModel: Int) {
        
        self.Name = Name
        self.Image = Image
        self.ProductType = ProductType
        self.ProductPrice = ProductPrice
        self.ProductCode = ProductCode
        self.IsFavourite = IsFavourite
        self.ARModel = ARModel
    }

    let Name: String
    let Image: String
    let ProductType: String
    let ProductPrice: Int
    let ProductCode: String
    var IsFavourite: Bool
    let ARModel: Int

    
}

class ArrayModel: ObservableObject{
    
    @Published var Product: [ProductModel]
    
    init()
    {
        self.Product = [
            ProductModel(Name: "KALLAX", Image: "kallax", ProductType: "Shelving unit",  ProductPrice: 29, ProductCode:"00275848", IsFavourite: false, ARModel: 0),
            ProductModel(Name: "POÄNG", Image: "poang", ProductType: "Armchair",  ProductPrice: 95, ProductCode: "19197775", IsFavourite: false, ARModel: 1),
            ProductModel(Name: "EKTORP", Image: "ektorp", ProductType: "Armchair",  ProductPrice: 229, ProductCode: "69129086",IsFavourite: false, ARModel: 2),
            ProductModel(Name: "LISABO", Image: "lisabo", ProductType: "Desk",  ProductPrice: 129, ProductCode: "30299070",IsFavourite: false, ARModel: 3),
            ProductModel(Name: "HEKTAR", Image: "hektar", ProductType: "Floor Lamp",  ProductPrice: 45, ProductCode: "00215307",IsFavourite: false, ARModel: 4)]
    }
}

