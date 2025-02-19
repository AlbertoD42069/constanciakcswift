//
//  CertificateUIView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit
import FirebaseFirestore


class CertificateUIView: UIView {
    private let viewCertfKC : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let certTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CertTableViewCell.self, forCellReuseIdentifier: CertTableViewCell.identifier)
        return table
    }()
    
    private let viewModel: ViewModel = ViewModel()
    var certificateData: [CertificateData] = []

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        certTableView.dataSource = self
        certTableView.delegate = self
        addComponetsKC()
        setupConstraintsKC()
        viewModel.getCertificate(collection: "alumnosKC")
        viewModel.delegate = self
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addComponetsKC() {
        addSubview(viewCertfKC)
        viewCertfKC.addSubview(certTableView)
    }
    func setupConstraintsKC() {
        NSLayoutConstraint.activate([
            viewCertfKC.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewCertfKC.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewCertfKC.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewCertfKC.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            certTableView.topAnchor.constraint(equalTo: viewCertfKC.topAnchor),
            certTableView.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 10),
            certTableView.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: 10),
            certTableView.bottomAnchor.constraint(equalTo: viewCertfKC.bottomAnchor),
        ])
    }
    /*
    func getDataStudents() {
        viewModel.getCertificate(collection: "alumnosKC")
        certificateData = viewModel.certificateData
        print(certificateData)
        }*/
}
extension CertificateUIView: viewModelProtocol {
    func getCerftData(cerftData: [CertificateData]) {
        certificateData = cerftData
    }
}
extension CertificateUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CertTableViewCell.identifier, for: indexPath) as! CertTableViewCell
        return cell
    }
    
    
}
