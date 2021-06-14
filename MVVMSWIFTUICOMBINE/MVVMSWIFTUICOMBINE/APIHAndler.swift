//
//  APIHAndler.swift
//  MVVMSWIFTUICOMBINE
//
//  Created by Alok Deepti on 10/06/21.
//  Copyright © 2021 Alok. All rights reserved.
//

import Foundation
import Combine


class APIHandler : APIHandlerProtocol {
    
    
    
    var cancellable = Set<AnyCancellable>()

    func fetch<T>(url: URL, decodingType: T.Type, completionHandler: CompletionHandler) where T : Decodable, T : Encodable {
    
         URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                
                switch completion {
                    
                case .finished:
                    print("finished")
                case .failure(let someError):
                      completionHandler?(nil, someError)
                }
                
            }) { (data) in
                
                do {
                let model = try JSONDecoder.init().decode(decodingType, from: data)
                    completionHandler?(model, nil)
                } catch {
                    completionHandler?(nil, error)

                }
        }
    .store(in: &cancellable)
        
    }
    
    var session: URLSession
    
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    
}
