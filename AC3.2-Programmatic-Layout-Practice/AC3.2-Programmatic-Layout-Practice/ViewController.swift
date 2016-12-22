//
//  ViewController.swift
//  AC3.2-Programmatic-Layout-Practice
//
//  Created by Louis Tur on 12/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .blue
    // 1. Add Scroll View 
    self.view.addSubview(self.scrollView)
    // 2. Add Scroll Constraints
    self.edgesForExtendedLayout = []
    let _ = [scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
             scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
             scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
             scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8)].map { $0.isActive = true }
    // 3. Add View 
    self.scrollView.addSubview(redView)
    // 4. Add View Contraints
    let _ = [redView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
             redView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
             redView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             redView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 2.0),
             redView.widthAnchor.constraint(equalTo: self.view.widthAnchor)].map { $0.isActive = true
    }
    // 5. Make it scroll
    scrollView.isScrollEnabled = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  lazy var scrollView: UIScrollView = {
    let view: UIScrollView = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .green
    view.showsVerticalScrollIndicator = true
    view.showsHorizontalScrollIndicator = true
    view.alwaysBounceHorizontal = true
    view.alwaysBounceVertical = true
    return view
  }()
  
  lazy var redView: UIView = {
    let view: UIView = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()

}

