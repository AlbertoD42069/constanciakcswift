//
//  CertificateUIViewViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

class CertificateUIViewViewController: UIViewController {
    
    private let certificateView: CertificateUIView = {
        let view = CertificateUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraintsKC()
        
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
}
