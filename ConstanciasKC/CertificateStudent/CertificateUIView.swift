//
//  CertificateUIView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit
import FirebaseFirestore

protocol CefrtNavProtocol: AnyObject {
    func goToNavDetails(modelKC: CertificateData)
}

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
    var delegate: CefrtNavProtocol?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel.getCertificate(collection: "alumnosKC")
        addComponetsKC()
        setupConstraintsKC()
        viewModel.delegate = self
        self.certTableView.dataSource = self
        self.certTableView.delegate = self
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
}
extension CertificateUIView: viewModelProtocol {
    func getCerftData(cerftData: [CertificateData]) {
        certificateData = cerftData
        certificateData = viewModel.certificateData
        certTableView.reloadData()
    }
}
extension CertificateUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let studentCount = certificateData.count
        return studentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CertTableViewCell.identifier, for: indexPath) as! CertTableViewCell
        let modelKC = certificateData[indexPath.row]
        cell.setupData(data: modelKC)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelCerft = certificateData[indexPath.row]
        delegate?.goToNavDetails(modelKC: modelCerft)
    }
}
