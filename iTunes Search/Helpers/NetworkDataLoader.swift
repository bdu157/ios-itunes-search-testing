//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Dongwoo Pae on 9/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    // question: what do we need for data in/data out?
    // need back: Data and Error
    // provide: URLRequest
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?)-> Void)
}
