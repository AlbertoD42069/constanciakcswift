//
//  HomeKCUITabBarController.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 01/02/25.
//

import UIKit

class HomeKCUITabBarController: UITabBarController {
    
    let vcCertificate = CertificateUIViewViewController()
    let vcAddStudent = AddStudentUIViewViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTabBarSetup()
        navBarSetup()

        // Do any additional setup after loading the view.
    }
    func navBarSetup(){
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    func HomeTabBarSetup(){
       
        
        let certfNav = UINavigationController(rootViewController: vcCertificate)
        let addStudentNav = UINavigationController(rootViewController: vcAddStudent)
        
        let certIcono = UIImage(systemName: "document")
        let addIcono = UIImage(systemName: "document.badge.plus")
        
        certfNav.tabBarItem = UITabBarItem(title: "Certificados", image: certIcono, tag: 1)
        addStudentNav.tabBarItem = UITabBarItem(title: "Agregar Alumno", image: addIcono, tag: 2)
        
        let items = [certfNav, addStudentNav]
        for nav in items {
            tabBar.barTintColor = .white
        }
        setViewControllers(items, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
