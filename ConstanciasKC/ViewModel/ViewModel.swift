//
//  ViewModel.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
protocol viewModelProtocol: AnyObject {
    func getCerftData(cerftData: [CertificateData])
}
class ViewModel {
    private let dbKindeC = Firestore.firestore()
    var certificateData = [CertificateData]()
    private let firebaseServices = FirebaseServices()
    private var certificateDataRequest: [CertificateDataRequest] = []
    
    var delegate : viewModelProtocol?
    
    func getCertificate(collection: String) {
        firebaseServices.getCertificateCollection(coleccion: collection) { certificate in
            self.certificateData = certificate
            self.delegate?.getCerftData(cerftData: self.certificateData)
            }
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
