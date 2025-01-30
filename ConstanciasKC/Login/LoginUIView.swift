//
//  LoginUIView.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import UIKit

class LoginUIView: UIView {
    private let titleLCLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Bienvenido"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .black
        return lbl
    }()
    private let userNameTF: UITextField = {
        let tf = UITextField()
        
        tf.placeholder = "Usuario"
        return tf
    }()
    
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
