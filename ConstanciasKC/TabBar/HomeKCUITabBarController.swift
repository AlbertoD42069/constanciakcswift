//
//  HomeKCUITabBarController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 01/02/25.
//

import UIKit

class HomeKCUITabBarController: UITabBarController {
    
    let vcCertificate = CertificateViewController()
    let vcAddStudent = AddStudentUIViewViewController()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTabBarSetup()
        navBarSetup()
        // Do any additional setup after loading the view.
    }
    func navBarSetup(){
        let imageLEftBtnCK = UIImage(systemName: "gearshape.fill")
        let leftBtnCK = UIBarButtonItem(image: imageLEftBtnCK, style: .plain, target: .none, action: #selector(goPerfilKC))
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
    }
    @objc func goPerfilKC(){
        
        
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
