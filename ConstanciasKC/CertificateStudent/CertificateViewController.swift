//
//  CertificateUIViewViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

class CertificateViewController: UIViewController {
    
    private let certificateView: CertificateUIView = {
        let view = CertificateUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //var certData = CertificateDataTable()
    //private let viewModel: ViewModel = ViewModel()
    private var certificateDataRequest = CertificateDataRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraintsKC()
        //getDataStudents()
        
    }
    func addComponetsKC() {
        view.addSubview(certificateView)
    }
    func setupConstraintsKC() {
        NSLayoutConstraint.activate([
            certificateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            certificateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            certificateView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            certificateView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    //func getDataStudents() {
    //    let model = viewModel.getCertificate()
    //    print(model)
    //
    //}
}
