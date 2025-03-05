//
//  HomeKCUITabBarController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 01/02/25.
//

import UIKit

class HomeKCUITabBarController: UITabBarController {
    
    private let vcCertificate = CertificateViewController()
    private let vcAddStudent = AddStudentUIViewViewController()
    private let vcPerfil = PerfilViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTabBarSetup()
        navBarSetup()
        // Do any additional setup after loading the view.
    }
    func navBarSetup(){
        let imageLEftBtnCK = UIImage(systemName: "gearshape.fill")
        let leftBtnCK = UIBarButtonItem(image: imageLEftBtnCK, style: .plain, target: self, action: #selector(goPerfilKC))
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.rightBarButtonItem = leftBtnCK
    }
    @objc func goPerfilKC(){
        navigationController?.pushViewController(vcPerfil, animated: true)
        
    }
    func HomeTabBarSetup(){
       
        let certfNav = UINavigationController(rootViewController: vcCertificate)
        let addStudentNav = UINavigationController(rootViewController: vcAddStudent)
        
        let certIcono = UIImage(systemName: "document")
        let addIcono = UIImage(systemName: "document.badge.plus")
        
        certfNav.tabBarItem = UITabBarItem(title: "Certificados", image: certIcono, tag: 1)
        addStudentNav.tabBarItem = UITabBarItem(title: "Agregar Alumno", image: addIcono, tag: 2)
        
        vcCertificate.navigationItem.largeTitleDisplayMode = .automatic
        vcCertificate.navigationItem.title = "Certificados"
        vcAddStudent.navigationItem.largeTitleDisplayMode = .automatic
        vcAddStudent.navigationItem.title = "Agregar Alumno"
        
        let items = [certfNav, addStudentNav]
        for nav in items {
            tabBar.barTintColor = .white
        }
        setViewControllers(items, animated: true)
    }

}
