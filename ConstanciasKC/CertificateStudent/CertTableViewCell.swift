//
//  CertTableViewCell.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 12/02/25.
//

import UIKit

class CertTableViewCell: UITableViewCell {
    
    private let studentNameKCLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nombre:"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    private let studentCURPKCLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Curp:"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    private let studentNameKC: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let studentCURPKC: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    var certificateData: [CertificateData] = []

    static let identifier: String = "CertTableViewCell"
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addcomponets()
        setupViewContainter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addcomponets(){
        addSubview(studentNameKCLbl)
        addSubview(studentCURPKCLbl)
        addSubview(studentNameKC)
        addSubview(studentCURPKC)
    }
    func setupViewContainter(){
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 150),
            
            studentNameKCLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            studentNameKCLbl.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            studentNameKC.leadingAnchor.constraint(equalTo: leadingAnchor),
            studentNameKC.topAnchor.constraint(equalTo: studentNameKCLbl.bottomAnchor, constant: 10),
            
            studentCURPKCLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
            studentCURPKCLbl.topAnchor.constraint(equalTo: studentNameKC.bottomAnchor, constant: 10),

            studentCURPKC.topAnchor.constraint(equalTo: studentCURPKCLbl.bottomAnchor, constant: 10),
            studentCURPKC.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    func setupData(data: CertificateData) {
        studentNameKC.text = data.nombres ?? "error"
        studentCURPKC.text = data.curp ?? "error"
    }
}
