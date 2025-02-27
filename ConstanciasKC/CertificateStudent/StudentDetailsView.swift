//
//  StudentDetailsView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 25/02/25.
//

import UIKit

class StudentDetailsView: UIView {
    
    private let viewDetailsKC: UIView = {
        let viewKC = UIView()
        viewKC.translatesAutoresizingMaskIntoConstraints = false
        return viewKC
    }()
    private let imageDetailKS: UIImageView = {
        let imageViewKS = UIImageView()
        imageViewKS.translatesAutoresizingMaskIntoConstraints = false
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
    private let viewBTNKCLbl: UIView = {
        let viewBTN = UIView()
        viewBTN.translatesAutoresizingMaskIntoConstraints = false
        return viewBTN
    }()
    private let createPDFKCButton: UIButton = {
        let createPDF = UIButton(type: .system)
        createPDF.translatesAutoresizingMaskIntoConstraints = false
        return createPDF
    }()
    private let eliminarKCButton: UIButton = {
        let eliminarKC = UIButton(type: .system)
        eliminarKC.translatesAutoresizingMaskIntoConstraints = false
        return eliminarKC
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
