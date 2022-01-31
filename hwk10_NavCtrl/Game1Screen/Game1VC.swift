//
//  Game1VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game1VC: UIViewController {
    private var circle: UIView!

    override func loadView() {
        let custonView = UIView(frame: UIScreen.main.bounds)
        view = custonView
        view.backgroundColor = UIColor(red: 0.7373, green: 0.6745, blue: 0, alpha: 1.0)
        
        circle = UIView(frame: CGRect(x: view.bounds.midX - 25, y: view.bounds.midY - 25, width: 50, height: 50))
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.masksToBounds = true
        circle.backgroundColor = UIColor(red: 0, green: 0.1294, blue: 0.9882, alpha: 1.0)
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Game1"
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.4, green: 0.3176, blue: 0, alpha: 1.0)
        
        let tapRecognizerVC = UITapGestureRecognizer(target: self, action: #selector(tapVC))
        let tapRecognizerCircle = UITapGestureRecognizer(target: self, action: #selector(tapCircle))
        view.addGestureRecognizer(tapRecognizerVC)
        circle.addGestureRecognizer(tapRecognizerCircle)
        
    }
    
    override func viewWillLayoutSubviews() {
        circle.frame = CGRect(x: view.bounds.midX - 25, y: view.bounds.midY - 25, width: 50, height: 50)
    }
    
    @objc private func tapVC(sender: UITapGestureRecognizer) {
        print(sender.location(in: view))
        
    }
    
    @objc private func tapCircle(sender: UITapGestureRecognizer) {
        print("tapCircle")
    }
    

}
