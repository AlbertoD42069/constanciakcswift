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
        print(certificateData!)
    }
    func setupDetails(dataDetailsKC: CertificateData){
        print(dataDetailsKC)
    }
}
