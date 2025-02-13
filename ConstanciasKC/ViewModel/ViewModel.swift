//
//  ViewModel.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
/*
enum RpviderType: String {
    case basic
}
 */

class ViewModel {
    private let dbKindeC = Firestore.firestore()
    private var certificateData = [CertificateData]()
    private let firebaseServices = FirebaseServices()
    private var certificateDataRequest: [CertificateDataRequest] = []

    func getCertificate() -> [CertificateDataRequest] {
        let collectionKCShared = CollectionKC.shared.collectionsKC
        firebaseServices.getCertificateCollection(coleccion: collectionKCShared) { certificate in
            let certificateRequestData = certificate.map {
                CertificateDataRequest (
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
            self.certificateDataRequest = certificateRequestData
        }
        return self.certificateDataRequest
    }
    func AuthKC(user: String?, password: String?) -> Bool {
        var correctIsUser : Bool = false
        if let userKC = user, let passKC = password {
            firebaseServices.userAuth(user: userKC, password: passKC)
            correctIsUser = true
        }else {
            correctIsUser = false
        }
        return correctIsUser
    }
    func addStudentData (data: AddStudentData){
        firebaseServices.setStudent(addData: data)
    }
    func userKCSignOut() {
        firebaseServices.userSignOut()
    }
    
}
