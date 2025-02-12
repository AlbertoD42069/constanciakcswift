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

    func getCertificate(){
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
            print("-----------*****\(self.certificateDataRequest)")
        }
    }
    func userAuthKC(user: String, password: String){
        Auth.auth().signIn(withEmail: user, password: password) { (result, error) in
            if let result = result, error == nil{
                print("inicio de sesion correcto con usuario \(result.user.email!)")
            }else {
                print("error usuario y contraseña")
                print(error!)
            }
        }
    }
    func addStudentData (data: AddStudentData){
        firebaseServices.setStudent(addData: data)
    }
    
}
