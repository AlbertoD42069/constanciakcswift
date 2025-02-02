//
//  LoginUIView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

protocol LoginProtocol: AnyObject {
    func login(userName: String, password: String)
}

class LoginUIView: UIView {
    private let viewKC : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLblCK: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "BIENVENIDO"
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    private let userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Usuario"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    private let userNameTxt: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.text = "adela.dominguez@kindercuauhtemoc.com"
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let passwordNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Password"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .black
        return lbl
    }()
    private let passwordNameTxt: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.cornerRadius = 4
        txt.layer.borderWidth = 0.5
        txt.text = "C0nstK1nd3r"
        txt.setLeftPaddingPoints(10)
        return txt
    }()
    private let loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Iniciar Sesion", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 4
        btn.addTarget(self, action: #selector(loginKC), for: .touchUpInside)
        return btn
    }()
    
    private let viewModelKC = ViewModel()
    var loginKCDelegate: LoginProtocol?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponetsKC()
        setAutolayoutKC()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func addComponetsKC(){
        addSubview(viewKC)
        viewKC.addSubview(titleLblCK)
        viewKC.addSubview(userNameLbl)
        viewKC.addSubview(userNameTxt)
        viewKC.addSubview(passwordNameLbl)
        viewKC.addSubview(passwordNameTxt)
        viewKC.addSubview(loginBtn)
    }
    func setAutolayoutKC(){
        NSLayoutConstraint.activate([
            viewKC.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewKC.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            viewKC.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewKC.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            titleLblCK.topAnchor.constraint(equalTo: viewKC.topAnchor, constant: 30),
            titleLblCK.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 10),
            titleLblCK.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -10),
            
            userNameLbl.topAnchor.constraint(equalTo: titleLblCK.bottomAnchor, constant: 50),
            userNameLbl.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 20),
            userNameLbl.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -20),
            
            userNameTxt.topAnchor.constraint(equalTo: userNameLbl.bottomAnchor, constant: 10),
            userNameTxt.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 20),
            userNameTxt.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -20),
            userNameTxt.heightAnchor.constraint(equalToConstant: 30),
            
            passwordNameLbl.topAnchor.constraint(equalTo: userNameTxt.bottomAnchor, constant: 10),
            passwordNameLbl.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 20),
            passwordNameLbl.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -20),
            
            passwordNameTxt.topAnchor.constraint(equalTo: passwordNameLbl.bottomAnchor, constant: 10),
            passwordNameTxt.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 20),
            passwordNameTxt.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -20),
            passwordNameTxt.heightAnchor.constraint(equalToConstant: 30),

            loginBtn.topAnchor.constraint(equalTo: passwordNameTxt.bottomAnchor, constant: 20),
            loginBtn.leadingAnchor.constraint(equalTo: viewKC.leadingAnchor, constant: 20),
            loginBtn.trailingAnchor.constraint(equalTo: viewKC.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func loginKC() {
        if let userKC = userNameTxt.text, let passKC = passwordNameTxt.text {
            loginKCDelegate?.login(userName: userKC, password: passKC)
        }
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
