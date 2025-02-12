//
//  AddStudentUIViewViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

class AddStudentUIViewViewController: UIViewController {
    
    private let viewCertificateKC: AddStudentUIView = {
        let view = AddStudentUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponetsKC()
        setupConstraintsKC()
        self.navigationController?.isNavigationBarHidden = true
        viewCertificateKC.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func addComponetsKC() {
        view.addSubview(viewCertificateKC)
    }
    func setupConstraintsKC() {
        NSLayoutConstraint.activate([
            viewCertificateKC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewCertificateKC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            viewCertificateKC.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewCertificateKC.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}
extension AddStudentUIViewViewController: AddStudentProtocol {
    func addStudent(data: AddStudentData) {
        viewModel.addStudentData(data: data)
    }
}
