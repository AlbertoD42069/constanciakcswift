//
//  PerfilUiView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 01/03/25.
//

import UIKit

protocol PerfilProtocol: AnyObject {
    func setEmail() -> String
}

class PerfilUiView: UIView {

    private let viewcontainerKC: UIView = {
        let viewKC = UIView()
        viewKC.translatesAutoresizingMaskIntoConstraints = false
        return viewKC
    }()
    private let perfilDetailKC: UIImageView = {
        let imageViewKS = UIImageView()
        imageViewKS.translatesAutoresizingMaskIntoConstraints = false
        imageViewKS.image = UIImage(systemName: "person.circle")
        imageViewKS.contentMode = .scaleAspectFit
        return imageViewKS
    }()
    private let emailKCLbl: UILabel = {
        let email = UILabel()
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    private let nameDirectoriaKCLbl: UILabel = {
        let names = UILabel()
        names.translatesAutoresizingMaskIntoConstraints = false
        return names
    }()
    private let schoolNameKCLbl: UILabel = {
        let school = UILabel()
        school.translatesAutoresizingMaskIntoConstraints = false
        return school
    }()
    private let logoutKCBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(logoutKC), for: .touchUpInside)
        btn.setTitle("Cerrar Sesion", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    var perfilDelegate : PerfilProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponets()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func addComponets() {
        addSubview(viewcontainerKC)
        viewcontainerKC.addSubview(perfilDetailKC)
        viewcontainerKC.addSubview(emailKCLbl)
        viewcontainerKC.addSubview(nameDirectoriaKCLbl)
        viewcontainerKC.addSubview(schoolNameKCLbl)
        viewcontainerKC.addSubview(logoutKCBtn)
        
    }
    func setAutoLayout() {
        NSLayoutConstraint.activate([
            viewcontainerKC.topAnchor.constraint(equalTo: topAnchor),
            viewcontainerKC.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewcontainerKC.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewcontainerKC.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            perfilDetailKC.topAnchor.constraint(equalTo: viewcontainerKC.topAnchor, constant: 10),
            perfilDetailKC.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 50),
            perfilDetailKC.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -50),
            perfilDetailKC.widthAnchor.constraint(equalToConstant: 150),
            perfilDetailKC.heightAnchor.constraint(equalToConstant: 150),
            
            emailKCLbl.topAnchor.constraint(equalTo: perfilDetailKC.bottomAnchor, constant: 10),
            emailKCLbl.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            emailKCLbl.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20),
            
            nameDirectoriaKCLbl.topAnchor.constraint(equalTo: emailKCLbl.bottomAnchor, constant: 10),
            nameDirectoriaKCLbl.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            nameDirectoriaKCLbl.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20),
            
            schoolNameKCLbl.topAnchor.constraint(equalTo: nameDirectoriaKCLbl.bottomAnchor, constant: 10),
            schoolNameKCLbl.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            schoolNameKCLbl.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20),
            
            logoutKCBtn.topAnchor.constraint(equalTo: emailKCLbl.bottomAnchor, constant: 10),
            logoutKCBtn.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            logoutKCBtn.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20)
        ])
    }
    @objc func logoutKC() {
        print("logout")
    }
    func setemail(email: String) {
        emailKCLbl.text = email
    }
}
