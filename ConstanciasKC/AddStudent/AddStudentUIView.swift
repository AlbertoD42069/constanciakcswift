//
//  AddStudentUIView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

protocol AddStudentProtocol: AnyObject {
    func addStudent(data: AddStudentData)
}

class AddStudentUIView: UIView {
    private let viewCertfKC : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleCerftLblCK: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Agregar alumno"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    private let cicloEscolarLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Ciclo Escolar"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let curpLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Curp"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let fechaNacimientoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Fecha de Nacimiento"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let gradoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Grado"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()

    private let matriculaLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Matriculo"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let nombresLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "nombres"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let primerApellidoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Primer Apellido"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let segundoApellidoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Segundo Apellido"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    // -------------------------------------------------------------
    
    private let cicloEscolarText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        txt.font = UIFont(name: "robotolight", size: 12)
        return txt
    }()
    private let curpText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let fechaNacimientoText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let gradoText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let matriculaText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private var nombresText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.font = UIFont(name: "robotolight", size: 12)
        txt.setLeftPaddingPoints(10)
        return txt
    }()
   
    private let primerApellidoText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let segundoApellidoText: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let addStudentBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Agregar alumno", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 4
        btn.addTarget(self, action: #selector(addStudentKC), for: .touchUpInside)
        return btn
    }()
    var delegate: AddStudentProtocol?
    var addStudData = AddStudentData()
    
    
    var dateKC = Date().formattedDate
    var timeKC = Date().formattedDateTime
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponentsForm()
        setAutoLayoutForm()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func addComponentsForm(){
        
        addSubview(viewCertfKC)
        viewCertfKC.addSubview(titleCerftLblCK)
        viewCertfKC.addSubview(cicloEscolarLabel)
        viewCertfKC.addSubview(curpLabel)
        viewCertfKC.addSubview(fechaNacimientoLabel)
        viewCertfKC.addSubview(gradoLabel)
        viewCertfKC.addSubview(matriculaLabel)
        viewCertfKC.addSubview(nombresLabel)
        viewCertfKC.addSubview(primerApellidoLabel)
        viewCertfKC.addSubview(segundoApellidoLabel)
//----------------------------------------------------------------
        viewCertfKC.addSubview(cicloEscolarText)
        viewCertfKC.addSubview(curpText)
        viewCertfKC.addSubview(fechaNacimientoText)
        viewCertfKC.addSubview(gradoText)
        viewCertfKC.addSubview(matriculaText)
        viewCertfKC.addSubview(nombresText)
        viewCertfKC.addSubview(primerApellidoText)
        viewCertfKC.addSubview(segundoApellidoText)
        
        viewCertfKC.addSubview(addStudentBtn)
    }
    func setAutoLayoutForm(){
        NSLayoutConstraint.activate([
            viewCertfKC.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewCertfKC.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            viewCertfKC.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewCertfKC.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            titleCerftLblCK.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 10),
            titleCerftLblCK.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -10),
            
            nombresLabel.topAnchor.constraint(equalTo: titleCerftLblCK.bottomAnchor, constant: 10),
            nombresLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            nombresLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            nombresText.topAnchor.constraint(equalTo: nombresLabel.bottomAnchor, constant: 10),
            nombresText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            nombresText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            nombresText.heightAnchor.constraint(equalToConstant: 30),
            
            primerApellidoLabel.topAnchor.constraint(equalTo: nombresText.bottomAnchor, constant: 10),
            primerApellidoLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            primerApellidoLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            primerApellidoText.topAnchor.constraint(equalTo: primerApellidoLabel.bottomAnchor, constant: 10),
            primerApellidoText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            primerApellidoText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            primerApellidoText.heightAnchor.constraint(equalToConstant: 30),
            
            segundoApellidoLabel.topAnchor.constraint(equalTo: primerApellidoText.bottomAnchor, constant: 10),
            segundoApellidoLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            segundoApellidoLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            segundoApellidoText.topAnchor.constraint(equalTo: segundoApellidoLabel.bottomAnchor, constant: 10),
            segundoApellidoText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            segundoApellidoText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            segundoApellidoText.heightAnchor.constraint(equalToConstant: 30),
            
            fechaNacimientoLabel.topAnchor.constraint(equalTo: segundoApellidoText.bottomAnchor, constant: 10),
            fechaNacimientoLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            fechaNacimientoLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            fechaNacimientoText.topAnchor.constraint(equalTo: fechaNacimientoLabel.bottomAnchor, constant: 10),
            fechaNacimientoText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            fechaNacimientoText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            fechaNacimientoText.heightAnchor.constraint(equalToConstant: 30),
            
            curpLabel.topAnchor.constraint(equalTo: fechaNacimientoText.bottomAnchor, constant: 10),
            curpLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            curpLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            curpText.topAnchor.constraint(equalTo: curpLabel.bottomAnchor, constant: 10),
            curpText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            curpText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            curpText.heightAnchor.constraint(equalToConstant: 30),
            
            matriculaLabel.topAnchor.constraint(equalTo: curpText.bottomAnchor, constant: 10),
            matriculaLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            matriculaLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            matriculaText.topAnchor.constraint(equalTo: matriculaLabel.bottomAnchor, constant: 10),
            matriculaText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            matriculaText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            matriculaText.heightAnchor.constraint(equalToConstant: 30),
            
            gradoLabel.topAnchor.constraint(equalTo: matriculaText.bottomAnchor, constant: 10),
            gradoLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            gradoLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            gradoText.topAnchor.constraint(equalTo: gradoLabel.bottomAnchor, constant: 10),
            gradoText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            gradoText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            gradoText.heightAnchor.constraint(equalToConstant: 30),
            
            cicloEscolarLabel.topAnchor.constraint(equalTo: gradoText.bottomAnchor, constant: 10),
            cicloEscolarLabel.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            cicloEscolarLabel.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            
            cicloEscolarText.topAnchor.constraint(equalTo: cicloEscolarLabel.bottomAnchor, constant: 10),
            cicloEscolarText.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            cicloEscolarText.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
            cicloEscolarText.heightAnchor.constraint(equalToConstant: 30),
            
            addStudentBtn.topAnchor.constraint(equalTo: cicloEscolarText.bottomAnchor, constant: 20),
            addStudentBtn.leadingAnchor.constraint(equalTo: viewCertfKC.leadingAnchor, constant: 20),
            addStudentBtn.trailingAnchor.constraint(equalTo: viewCertfKC.trailingAnchor, constant: -20),
        ])
    }
    func clearInput(){
        nombresText.text = ""
        primerApellidoText.text = ""
        segundoApellidoText.text = ""
        fechaNacimientoText.text = ""
        matriculaText.text = ""
        curpText.text = ""
        gradoText.text = ""
        cicloEscolarText.text = ""
        dateKC = ""
        timeKC = ""
    }
    @objc func addStudentKC(){
                
        addStudData.nombres = nombresText.text ?? ""
        addStudData.primerApellido = primerApellidoText.text ?? ""
        addStudData.segundoApellido = segundoApellidoText.text ?? ""
        addStudData.fechaNacimiento = fechaNacimientoText.text ?? ""
        addStudData.matricula = matriculaText.text ?? ""
        addStudData.curp = curpText.text ?? ""
        addStudData.grado = gradoText.text ?? ""
        addStudData.cicloEscolar = cicloEscolarText.text ?? ""
        addStudData.fechaExpedicion = dateKC
        addStudData.horaExpedicion = timeKC
              
        delegate?.addStudent(data: addStudData)
        clearInput()
    }
}
