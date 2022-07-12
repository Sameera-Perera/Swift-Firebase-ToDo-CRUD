//
//  ToDoViewModel.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.

import Foundation
import UIKit
import Firebase
import Combine

class ToDoViewModel: ObservableObject{
    @Published var isLoadingActive = false
    @Published var isErrorActive = false
    @Published var errorMsg = ""
    
    private let toDoService:ToDoServiceProtocol
    
    init(toDoService: ToDoServiceProtocol = ToDoService()) {
        self.toDoService = toDoService
    }

    func createAdvertisement(price:Double,
                             propertyType:String,
                             landSize:Double,
                             district:String,
                             areaType:String,
                             location: GeoPoint,
                             deedImage: UIImage,
                             propertyImage: [UIImage]
    ){
//        isErrorActive = false
//        errorMsg = ""
//        isLoadingActive = true
        
//        let toDoItem:ToDoItem = Property(price: price, propertyType: propertyType, landSize: landSize, district: district, areaType: areaType, location: location, deedImage: "", propertyImages: [""])
//
//        propertyService.createProperty(
//            property: property,
//            deedImage: deedImage,
//            propertyImage: propertyImage
//        ) { result in
//                switch result {
//                    case .success:
//                        self.dissmissView()
//                        self.isLoadingActive = false
//                    case let .failure(error):
//                        print(error)
//                        self.isLoadingActive = false
//                        self.errorMsg = "Somthing wrong"
//                        self.isErrorActive = true
//                }
//            }
    }
    
    func uploadImage(image: UIImage){
        isErrorActive = false
        errorMsg = ""
        isLoadingActive = true
        
//        propertyService.uploadImage(image: image) {result in
//                switch result {
//                    case .success:
//                        self.isLoadingActive = false
//                    case let .failure(error):
//                        print(error)
//                        self.isLoadingActive = false
//                        self.errorMsg = "Somthing wrong"
//                        self.isErrorActive = true
//                }
//            }
    }
}
