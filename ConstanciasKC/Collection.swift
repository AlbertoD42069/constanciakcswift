//
//  Collection.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 10/02/25.
//

import Foundation

class CollectionKC {
    static let shared = CollectionKC()
    var collectionsKC = "alumnosKC"
    private init() {}
}
class EmailKCSingleton {
    static let shared = EmailKCSingleton()
    var emailKC: String?
    func setEmail(email: String?) {
        self.emailKC = email
    }
    private init() {}
}
