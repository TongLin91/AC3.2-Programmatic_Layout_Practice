//
//  CameraCrossViewController.swift
//  AC3.2-Programmatic-Layout-Practice
//
//  Created by Tong Lin on 12/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class CameraCrossViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        self.view.addSubview(backG)
        let _ = [ backG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 21),
                  backG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                  backG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                  backG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)].map{ $0.isActive = true }
        
        let myBlock = [(topLH, "HLT"), (topLV,"VLT"), (topRH, "HRT"), (topRV, "VRT"), (bottomLH, "HLB"), (bottomLV, "VLB"), (bottomRH, "HRB"), (bottomRV, "VRB"), (centH, "HCC"), (centV, "VCC")]
        for (block, code) in myBlock{
            self.backG.addSubview(block)
            let id: [Character] = Array(code.characters)
            
            switch id[0] {
            case "V":
                let _ = [ block.heightAnchor.constraint(equalToConstant: 100),
                          block.widthAnchor.constraint(equalToConstant: 50)].map{ $0.isActive = true }
            case "H":
                let _ = [ block.heightAnchor.constraint(equalToConstant: 50),
                          block.widthAnchor.constraint(equalToConstant: 100)].map{ $0.isActive = true }
            default:
                print("never gonna print")
            }
            
            switch id[1] {
            case "L":
                block.leadingAnchor.constraint(equalTo: backG.leadingAnchor).isActive = true
            case "R":
                block.trailingAnchor.constraint(equalTo: backG.trailingAnchor).isActive = true
            default:
                block.centerXAnchor.constraint(equalTo: backG.centerXAnchor).isActive = true
            }
            
            switch id[2] {
            case "T":
                block.topAnchor.constraint(equalTo: backG.topAnchor).isActive = true
            case "B":
                block.bottomAnchor.constraint(equalTo: backG.bottomAnchor).isActive = true
            default:
                block.centerYAnchor.constraint(equalTo: backG.centerYAnchor).isActive = true
            }
        }
    }

    // MARK: - Navigation

    lazy var backG: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    lazy var topLH: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var topLV: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var topRH: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var topRV: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var bottomLH: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var bottomLV: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var bottomRH: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var bottomRV: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var centH: UIView = { return CameraCrossViewController.customView() }()
    
    lazy var centV: UIView = { return CameraCrossViewController.customView() }()
    
    static func customView() -> UIView{
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }
}
