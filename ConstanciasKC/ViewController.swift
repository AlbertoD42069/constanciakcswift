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
    private let collectionKC = CollectionKC.shared.collectionsKC

    
    private let viewLoginKC: LoginUIView = {
        let view = LoginUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraintsKC()
        getDataStudents()
        viewLoginKC.loginKCDelegate = self
        
        

    }
    func addComponetsKC() {
        view.addSubview(viewLoginKC)
    }
    func setupConstraintsKC() {
        NSLayoutConstraint.activate([
            viewLoginKC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewLoginKC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            viewLoginKC.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewLoginKC.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func getDataStudents() {
        viewModel.getCertificate(coleccion: collectionKC) { certificate in
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
}

extension ViewController: LoginProtocol {
    func login(userName: String, password: String) {
        let vcHomeKC = HomeKCUITabBarController()
        viewModel.userAuthKC(user: userName, password: password)
        self.navigationController?.pushViewController(vcHomeKC, animated: true)
    }
    
}
