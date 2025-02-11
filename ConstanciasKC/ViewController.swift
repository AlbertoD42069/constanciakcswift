//
//  ViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    private let viewModel = ViewModel()
    let collection = "alumnosKC"
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCertificate(collection: collection)
        // Do any additional setup after loading the view.
    }
}

/*viewModel.getCertificate(coleccion: "alumnosKC") { certificate in
    self.certificateData = certificate
    print(self.certificateData)
    var certDataRequest = self.certificateData.map{
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
}*/
