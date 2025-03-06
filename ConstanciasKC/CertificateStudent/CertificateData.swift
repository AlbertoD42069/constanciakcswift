//
//  CertificateData.swift
//  ConstanciasKC
//
//  Created by Jesus Alberto Diaz Dominguez on 29/01/25.
//

import Foundation

struct CertificateData: Codable {
    var cicloEscolar: String?
    var curp: String?
    var fechaExpedicion: String?
    var fechaNacimiento: String?
    var grado: String?
    var horaExpedicion: String?
    var matricula: String?
    var nombres: String?
    var primerApellido: String?
    var segundoApellido: String?
    
    init(cicloEscolar: String? = nil, curp: String? = nil, fechaExpedicion: String? = nil, fechaNacimiento: String? = nil, grado: String? = nil, horaExpedicion: String? = nil, matricula: String? = nil, nombres: String? = nil, primerApellido: String? = nil, segundoApellido: String? = nil) {
        self.cicloEscolar = cicloEscolar
        self.curp = curp
        self.fechaExpedicion = fechaExpedicion
        self.fechaNacimiento = fechaNacimiento
        self.grado = grado
        self.horaExpedicion = horaExpedicion
        self.matricula = matricula
        self.nombres = nombres
        self.primerApellido = primerApellido
        self.segundoApellido = segundoApellido
    }
}
struct CertificateDataRequest: Codable {
    var cicloEscolar: String?
    var curp: String?
    var fechaExpedicion: String?
    var fechaNacimiento: String?
    var grado: String?
    var horaExpedicion: String?
    var matricula: String?
    var nombres: String?
    var primerApellido: String?
    var segundoApellido: String?
}
struct CertificateDataTable : Codable {
    var nombres: String?
    var primerApellido: String?
    var segundoApellido: String?
    var curp: String?
    
    init(nombres: String? = nil, primerApellido: String? = nil, segundoApellido: String? = nil, curp: String? = nil) {
        self.nombres = nombres
        self.primerApellido = primerApellido
        self.segundoApellido = segundoApellido
        self.curp = curp
    }

}
