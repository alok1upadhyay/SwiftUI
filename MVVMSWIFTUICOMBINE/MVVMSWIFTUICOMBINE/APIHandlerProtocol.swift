//
//  APIHandlerProtocol.swift
//  MVVMSWIFTUICOMBINE
//
//  Created by Alok Deepti on 10/06/21.
//  Copyright © 2021 Alok. All rights reserved.
//

import Foundation


protocol APIHandlerProtocol {
  typealias CompletionHandler = ((Codable?, Error?)->())?

    var session: URLSession {
        get
    }
    func fetch<T: Codable>(url: URL, decodingType: T.Type, completionHandler : CompletionHandler) -> Void
}
