//
//  ViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    private let viewModel = ViewModel()
    private var certificateData: [CertificateData] = []
    private var certificateDataRequest: [CertificateDataRequest] = []
     private let emailKC = "adela.dominguez@kindercuauhtemoc.com"
     private let passwordKC = "C0nstK1nd3r"

    override func viewDidLoad() {
        super.viewDidLoad()
        //authUser()
        //getDataStudents()
        
    }
    func getDataStudents() {
        viewModel.getCertificate(coleccion: "alumnosKC") { certificate in
            self.certificateData = certificate
            print(self.certificateData)
            let certDataRequest = self.certificateData.map{
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
    func authUser(){
        viewModel.userAuthKC(user: emailKC, password: passwordKC)
    }
}

