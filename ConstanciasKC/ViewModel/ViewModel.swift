//
//  ViewModel.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import Foundation
import FirebaseFirestore

class ViewModel {
    private let dbKindeC = Firestore.firestore()
    private (set) var certificateData = [CertificateData]()
    func getCertificate(coleccion: String, succes: @escaping(_ certificate:[CertificateData])-> () ) {
        let sugerencias = dbKindeC.collection(coleccion)
        sugerencias.addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else { return }
            self.certificateData = document.compactMap{
                try? $0.data(as: CertificateData.self)
            }
            succes(self.certificateData)
            
        }
    }

}
