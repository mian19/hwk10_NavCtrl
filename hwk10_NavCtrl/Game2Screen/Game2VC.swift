//
//  Game2VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game2VC: UIViewController {
    private var circle: UIView!
    private let radiusOfCircle: CGFloat = 50

    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor(red: 0.4275, green: 0.7216, blue: 0.7294, alpha: 1.0)
        view = customView
        
        circle = UIView()
        circle.backgroundColor = .red
        
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workWithNavCtrl()

    }
    
    override func viewWillLayoutSubviews() {
        circle.frame = CGRect(x: view.bounds.midX - radiusOfCircle, y: view.bounds.midY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2)
        circle.layer.cornerRadius = radiusOfCircle
        circle.layer.masksToBounds = true
    }
    
    private func workWithNavCtrl() {
        self.navigationController?.navigationBar.backgroundColor = .systemBrown
        title = "Game 2"
    }
    
    private func workWithRecognizers() {
        
    }
    
    

}
