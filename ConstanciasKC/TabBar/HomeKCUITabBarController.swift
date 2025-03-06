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
        self.navigationItem.setHidesBackButton(true, animated: false)
       
    }
    func HomeTabBarSetup(){
       
        let certfNav = UINavigationController(rootViewController: vcCertificate)
        let addStudentNav = UINavigationController(rootViewController: vcAddStudent)
        let perfilNav = UINavigationController(rootViewController: vcPerfil)
        
        let certIcono = UIImage(systemName: "document")
        let addIcono = UIImage(systemName: "document.badge.plus")
        let perfilIcono = UIImage(systemName: "person.fill")
        
        certfNav.tabBarItem = UITabBarItem(title: "Certificados", image: certIcono, tag: 1)
        addStudentNav.tabBarItem = UITabBarItem(title: "Agregar Alumno", image: addIcono, tag: 2)
        perfilNav.tabBarItem = UITabBarItem(title: "perfil", image: perfilIcono, tag: 3)
        
        vcCertificate.navigationItem.largeTitleDisplayMode = .automatic
        vcCertificate.navigationItem.title = "Certificados"
        vcAddStudent.navigationItem.largeTitleDisplayMode = .automatic
        vcAddStudent.navigationItem.title = "Agregar Alumno"
        vcPerfil.navigationItem.largeTitleDisplayMode = .automatic
        vcPerfil.navigationItem.title = "Perfil"
        
        let items = [certfNav, addStudentNav, perfilNav]
        for nav in items {
            tabBar.barTintColor = .white
        }
        setViewControllers(items, animated: true)
    }

}
