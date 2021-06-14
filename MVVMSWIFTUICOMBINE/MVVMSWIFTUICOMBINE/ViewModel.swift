//
//  ViewModel.swift
//  MVVMSWIFTUICOMBINE
//
//  Created by Alok Deepti on 10/06/21.
//  Copyright © 2021 Alok. All rights reserved.
//

import Foundation
//import Combine

class ViewMOdel: ObservableObject {
    
    
    @Published var datasourceArray : [Todo]?
    @Published var error: Error?
    var apiHandler = APIHandler()
    
    func fetch<T>(decodingType: T.Type, url: URL) where T: Codable {
        
        apiHandler.fetch(url: url, decodingType: [Todo].self) { (data, error) in
            
            self.datasourceArray = data as? [Todo]
            self.error = error
        }
    }
}
