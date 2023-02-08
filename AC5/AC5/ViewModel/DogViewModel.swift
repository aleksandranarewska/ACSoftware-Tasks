//
//  DogViewModel.swift
//  AC5
//
//  Created by Admin on 08/02/2023.
//

import Foundation
class DogViewModel {
    
    var dogData:DogDataModel?
    private let sourcesURL = URL(string: "https://dog.ceo/api/breeds/list/all")!

    func getDogData(completion : @escaping () -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(DataModel.self, from: data)
                var result = [Dog]()
                
                if let keyArray = empData.message?.keys {
                    for key in keyArray {
                        result.append(Dog(breed: key))
                    }
                }
                self?.dogData = DogDataModel(data:result)
                completion()
            }
        }.resume()
    }
}
