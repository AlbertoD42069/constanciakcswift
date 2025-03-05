//
//  PerfilViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 01/03/25.
//

import UIKit

class PerfilViewController: UIViewController {
    
    private let perfikKCView: PerfilUiView = {
        let viewKCperfil = PerfilUiView()
        viewKCperfil.translatesAutoresizingMaskIntoConstraints = false
        return viewKCperfil
    }()
    
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    func addComponetsKC() {
        view.addSubview(perfikKCView)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            perfikKCView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            perfikKCView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            perfikKCView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            perfikKCView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}
