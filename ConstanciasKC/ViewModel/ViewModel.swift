//
//  ViewModel.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import Foundation

class ViewModel {
    private let firebaseServices = FirebaseServices()
    private var certificateDataRequest: [CertificateDataRequest] = []

    func getCertificate(collection: String) {
        firebaseServices.getCertificateData(coleccion: collection) { certificate in
            let certDataRequest = certificate.map{
                CertificateDataRequest(
                    cicloEscolar: $0.cicloEscolar,
                    curp: $0.curp,
                    fechaExpedicion: $0.fechaExpedicion,
                    fechaNacimiento: $0.fechaNacimiento,
                    grado: $0.grado,
                    horaExpedicion: $0.horaExpedicion,
                    matricula: $0.matricula,
                    nombres: $0.nombres,
                    primerApellido: $0.primerApellido,
                    segundoApellido: $0.segundoApellido
                )
            }
            self.certificateDataRequest = certDataRequest
            print("----------- \(self.certificateDataRequest)")
        }
    }
    func authKC(userKC: String?, passwordKC: String?) {
        guard let userK = userKC, let pass = passwordKC  else {
            return
        }
        
    }

}
/*
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
 */
