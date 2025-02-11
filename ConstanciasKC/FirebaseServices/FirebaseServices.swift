//
//  FirebaseServices.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 09/02/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AddData: Codable {
    var cicloEscolar: String?
    var curp: String?
    var fechaExpedicion: String?
    var fechaNacimiento: String?
    var grado: String?
    var horaExpedicion: String?
    var matricula: String?
    var nombres: String?
    var primerApellido: String?
    var segundoApellido: String?
}


class FirebaseServices {
    private let dbKindeC = Firestore.firestore()
    private var certificateData = [CertificateData]()
    func getCertificateData(coleccion: String, succes: @escaping(_ certificate:[CertificateData])-> () ) {
        let student = dbKindeC.collection(coleccion)
        student.addSnapshotListener { querySnapshot, error in
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
                print(error!)
            }
        }
    }
    func addStudentKC(collection: String, dataKC: String, succes: @escaping(Result<) -> () ){
        let student = dbKindeC.collection(collection).document(dataKC).setData(<#T##documentData: [String : Any]##[String : Any]#>)
        
    }

}
/*
 import FirebaseFirestore
 import FirebaseFirestoreSwift

 class FirebaseService {
     private let db = Firestore.firestore()
     private let collectionName = "certificates"

     // 📌 Función para agregar un certificado a Firestore
     func addCertificate(_ certificate: CertificateData, completion: @escaping (Result<Void, Error>) -> Void) {
         do {
             try db.collection(collectionName).document(certificate.id).setData(from: certificate) { error in
                 if let error = error {
                     completion(.failure(error))
                 } else {
                     completion(.success(()))
                 }
             }
         } catch {
             completion(.failure(error))
         }
     }

     // 📌 Función para obtener todos los certificados desde Firestore
     func getCertificates(completion: @escaping (Result<[CertificateData], Error>) -> Void) {
         db.collection(collectionName).getDocuments { snapshot, error in
             if let error = error {
                 completion(.failure(error))
                 return
             }

             var certificates: [CertificateData] = []
             for document in snapshot?.documents ?? [] {
                 if let certificate = try? document.data(as: CertificateData.self) {
                     certificates.append(certificate)
                 }
             }
             completion(.success(certificates))
         }
     }
 }

 */
