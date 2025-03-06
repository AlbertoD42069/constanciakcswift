//
//  StudentDetailsViewController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 23/02/25.
//

import UIKit

class StudentDetailsViewController: UIViewController {

    var certificateData: CertificateData?
    
    private let studentDetailsView: StudentDetailsView = {
        let viewDetails = StudentDetailsView()
        viewDetails.translatesAutoresizingMaskIntoConstraints = false
        return viewDetails
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addCompnets()
        setupautolaout()
        view.backgroundColor = .white
        studentDetailsView.setupLbl(dataStudent: certificateData!)
    }
    func addCompnets() {
        view.addSubview(studentDetailsView)
    }
    func setupautolaout() {
        NSLayoutConstraint.activate([
            studentDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            studentDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            studentDetailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            studentDetailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
