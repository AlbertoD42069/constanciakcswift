//
//  StudentDetailsView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 25/02/25.
//

import UIKit

class StudentDetailsView: UIView {
    
    private let viewcontainerKC: UIView = {
        let viewKC = UIView()
        viewKC.translatesAutoresizingMaskIntoConstraints = false
        return viewKC
    }()
    private let viewDetailsKC: UIStackView = {
        let viewKC = UIStackView()
        viewKC.axis = .vertical
        viewKC.distribution = .fillEqually
        viewKC.spacing = 10
        viewKC.translatesAutoresizingMaskIntoConstraints = false
        return viewKC
    }()
    private let imageDetailKS: UIImageView = {
        let imageViewKS = UIImageView()
        imageViewKS.translatesAutoresizingMaskIntoConstraints = false
        imageViewKS.image = UIImage(systemName: "person.circle")
        imageViewKS.contentMode = .scaleAspectFit
        
        return imageViewKS
    }()
    private let namesKSLbl: UILabel = {
        let names = UILabel()
        names.translatesAutoresizingMaskIntoConstraints = false
        return names
    }()
    private let firstNameKSLbl: UILabel = {
        let firstName = UILabel()
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
    }()
    private let secondNameKSLbl: UILabel = {
        let secondName = UILabel()
        secondName.translatesAutoresizingMaskIntoConstraints = false
        return secondName
    }()
    private let matriculaKCLbl: UILabel = {
        let matricula = UILabel()
        matricula.translatesAutoresizingMaskIntoConstraints = false
        return matricula
    }()
    private let gradoKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let curpKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let fechaNacimientoKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let fechaExpedicionKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let horaExpedicionKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let cicloEscolarKCLbl: UILabel = {
        let labelNameKS = UILabel()
        labelNameKS.translatesAutoresizingMaskIntoConstraints = false
        return labelNameKS
    }()
    private let createPDFKCButton: UIButton = {
        let createPDF = UIButton(type: .system)
        createPDF.translatesAutoresizingMaskIntoConstraints = false
        createPDF.addTarget(self, action: #selector(createPdfKc), for: .touchUpInside)
        createPDF.setTitle("Generar PDF", for: .normal)
        createPDF.tintColor = .white
        createPDF.backgroundColor = .systemBlue
        return createPDF
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponetKC()
        setAutoLayoutKC()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func addComponetKC(){
        addSubview(viewcontainerKC)
        viewcontainerKC.addSubview(imageDetailKS)
        viewcontainerKC.addSubview(viewDetailsKC)
        viewDetailsKC.addArrangedSubview(namesKSLbl)
        viewDetailsKC.addArrangedSubview(firstNameKSLbl)
        viewDetailsKC.addArrangedSubview(secondNameKSLbl)
        viewDetailsKC.addArrangedSubview(fechaNacimientoKCLbl)
        viewDetailsKC.addArrangedSubview(curpKCLbl)
        viewDetailsKC.addArrangedSubview(matriculaKCLbl)
        viewDetailsKC.addArrangedSubview(gradoKCLbl)
        viewDetailsKC.addArrangedSubview(fechaExpedicionKCLbl)
        viewDetailsKC.addArrangedSubview(horaExpedicionKCLbl)
        viewDetailsKC.addArrangedSubview(cicloEscolarKCLbl)
        viewcontainerKC.addSubview(createPDFKCButton)
    }
    func setAutoLayoutKC(){
        NSLayoutConstraint.activate([
            viewcontainerKC.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewcontainerKC.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewcontainerKC.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewcontainerKC.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            imageDetailKS.topAnchor.constraint(equalTo: viewcontainerKC.topAnchor, constant: 10),
            imageDetailKS.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 50),
            imageDetailKS.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -50),
            imageDetailKS.widthAnchor.constraint(equalToConstant: 150),
            imageDetailKS.heightAnchor.constraint(equalToConstant: 150),
            
            viewDetailsKC.topAnchor.constraint(equalTo: imageDetailKS.bottomAnchor, constant: 10),
            viewDetailsKC.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            viewDetailsKC.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20),
            
            createPDFKCButton.topAnchor.constraint(equalTo: viewDetailsKC.bottomAnchor, constant: 10),
            createPDFKCButton.leadingAnchor.constraint(equalTo: viewcontainerKC.leadingAnchor, constant: 20),
            createPDFKCButton.trailingAnchor.constraint(equalTo: viewcontainerKC.trailingAnchor, constant: -20)
        ])
    }
    func setupLbl(dataStudent: CertificateData) {
        namesKSLbl.text = dataStudent.nombres
        firstNameKSLbl.text = dataStudent.primerApellido
        secondNameKSLbl.text = dataStudent.segundoApellido
        fechaNacimientoKCLbl.text = dataStudent.fechaNacimiento
        curpKCLbl.text = dataStudent.curp
        matriculaKCLbl.text = dataStudent.matricula
        gradoKCLbl.text = dataStudent.grado
        fechaExpedicionKCLbl.text = dataStudent.fechaExpedicion
        horaExpedicionKCLbl.text = dataStudent.horaExpedicion
        cicloEscolarKCLbl.text = dataStudent.cicloEscolar
    }
    @objc func createPdfKc(){
        print("crear pdf")
    }
}
