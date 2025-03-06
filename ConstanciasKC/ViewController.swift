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
    private var certificateData: [CertificateData] = []
    private var certificateDataRequest: [CertificateDataRequest] = []
    private let collectionKC = CollectionKC.shared.collectionsKC
    private let viewModel = ViewModel()
    private let emailSingleton = EmailKCSingleton.shared
    private let viewLoginKC: LoginUIView = {
        let view = LoginUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraintsKC()
        //getDataStudents()
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
     
}

extension ViewController: LoginProtocol {
    func login(userName: String, password: String) {
        let vcHomeKC = HomeKCUITabBarController()
        let userKCCorrect = viewModel.AuthKC(user: userName, password: password)
        if userKCCorrect {
            emailSingleton.setEmail(email: userName)
            self.navigationController?.pushViewController(vcHomeKC, animated: true)
        }else {
            print("error")
        }
    }
    
}
