//
//  CertTableViewCell.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 12/02/25.
//

import UIKit

class CertTableViewCell: UITableViewCell {
    
    private let studentNameKC: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "alumno"
        return lbl
    }()
    private let studentCURPKC: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "curp"
        return lbl
    }()
    
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
        addSubview(studentNameKC)
        addSubview(studentCURPKC)
    }
    func setupViewContainter(){
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 80),
            studentNameKC.leadingAnchor.constraint(equalTo: leadingAnchor),
            studentNameKC.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            studentCURPKC.topAnchor.constraint(equalTo: studentNameKC.bottomAnchor, constant: 10),
            studentCURPKC.leadingAnchor.constraint(equalTo: leadingAnchor),

        ])
    }

}
/*
 required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }
 func addcomponets(){
     addSubview(sugerenciaTxt)

 }
 func setupViewContainter(){
     NSLayoutConstraint.activate([
         sugerenciaTxt.centerYAnchor.constraint(equalTo: centerYAnchor),
         sugerenciaTxt.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

     ])
 }

 */
