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
    func getCertificate(coleccion: String, succes: @escaping(_ certificate:[CertificateData])-> () ) {
        let certificate = dbKindeC.collection(coleccion)
        certificate.addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else { return }
            self.certificateData = document.compactMap{
                try? $0.data(as: CertificateData.self)
            }
            succes(self.certificateData)
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
