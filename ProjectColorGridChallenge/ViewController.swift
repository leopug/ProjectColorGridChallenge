//
//  ViewController.swift
//  ProjectColorGridChallenge
//
//  Created by Ana Caroline de Souza on 08/06/20.
//  Copyright © 2020 Leonardo Maia Pugliese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let numViewPerRow = 15
    var cells = [String: UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        for j in 0...80 {
            for i in 0...numViewPerRow {
                let cell = UIView()
                cell.backgroundColor = randomColor()
                cell.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width
                    , width: width, height: width)
                cell.layer.borderColor = UIColor.black.cgColor
                cell.layer.borderWidth = 0.5
                view.addSubview(cell)
                let key = "\(i)\(j)"
                cells[key] = cell
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        print(location)
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)\(j)"
        cells[key]?.backgroundColor = .black
    }

    func randomColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    

}

