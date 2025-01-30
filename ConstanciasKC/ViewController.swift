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
    private var certificateData: [CertificateData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCertificate(coleccion: "alumnosKC") { certificate in
            self.certificateData = certificate
            print(self.certificateData)
            
        }
        // Do any additional setup after loading the view.
    }


}

