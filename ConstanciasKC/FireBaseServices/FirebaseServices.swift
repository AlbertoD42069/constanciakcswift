//
//  FirebaseServices.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 10/02/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseServices {
    private let dbKC = Firestore.firestore()
    private var certificateData = [CertificateData]()
    
    func getCertificateCollection(coleccion: String, succes: @escaping(_ certificate:[CertificateData])-> () ) {
        let certificates = dbKC.collection(coleccion)
        certificates.addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else { return }
            self.certificateData = document.compactMap{
                try? $0.data(as: CertificateData.self)
            }
            succes(self.certificateData)
        }
    }
    func setStudent(addData: AddStudentData) {
        
        guard let nameStudent = addData.nombres else {
            return
        }
    
        let collectionKCShared = CollectionKC.shared.collectionsKC
        let collectionKC = dbKC.collection(collectionKCShared)
        let documentKc = collectionKC.document(nameStudent)
        
        documentKc.setData([
            "cicloEscolar": addData.cicloEscolar!,
            "curp": addData.curp!,
            "fechaExpedicion": addData.fechaExpedicion!,
            "fechaNacimiento": addData.fechaNacimiento!,
            "grado": addData.grado!,
            "horaExpedicion": addData.horaExpedicion!,
            "matricula": addData.matricula!,
            "nombres": addData.nombres!,
            "primerApellido" : addData.primerApellido!,
            "segundoApellido" : addData.segundoApellido!,
            
        ]){ err in
            if let err = err {
                print("Error: \(err) al añadir el alumno.")
            }else {
                print("Alumno agregado de forma correcta")
            }
            
        }
    }
    
    func userAuthKC(user: String, password: String){
        Auth.auth().signIn(withEmail: user, password: password) { (result, error) in
            if let result = result, error == nil{
                print("inicio de sesion correcto con usuario \(result.user.email!)")
            }else {
                print(error!)
            }
        }
    }
    func logoutUser(){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error al cerrar la sesion: \(signOutError)")
        }
    }
    
}
