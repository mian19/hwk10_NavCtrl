//
//  Game3VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game3VC: UIViewController {
    private var circle: UIView!
    private let radiusOfCircle: CGFloat = 35
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = UIColor(red: 0.7373, green: 0.6745, blue: 0, alpha: 1.0)
        
        circle = UIView()
        circle.backgroundColor = .red
        
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workWithNavCtrl()
        workWithPan()
    }
    
    override func viewWillLayoutSubviews() {
        circle.frame = CGRect(x: view.bounds.midX - radiusOfCircle, y: view.bounds.midY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2)
        circle.layer.cornerRadius = radiusOfCircle
        circle.layer.masksToBounds = true
    }
    
    private func workWithNavCtrl() {
        self.navigationController?.navigationBar.backgroundColor = .systemBrown
        title = "Game 3"
    }
    
    private func workWithPan() {
        let panGestRec = UIPanGestureRecognizer(target: self, action: #selector(panToCircle))
        circle.addGestureRecognizer(panGestRec)
    }
    
    @objc private func panToCircle(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed {
            let translation = recognizer.translation(in: self.view)
            var newX = circle.center.x + translation.x
            var newY = circle.center.y + translation.y
            
            // 1 point permit to stay in SafeArea
            if newX <= view.safeAreaLayoutGuide.layoutFrame.minX + radiusOfCircle {
                newX = view.safeAreaLayoutGuide.layoutFrame.minX + radiusOfCircle + 1
            } else if newX >= view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle {
                newX = view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle - 1
            }
            
            if newY <= view.safeAreaLayoutGuide.layoutFrame.minY + radiusOfCircle {
                newY = view.safeAreaLayoutGuide.layoutFrame.minY + radiusOfCircle + 1
            } else if newY >= view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle {
                newY = view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle - 1
            }
            
            circle.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
        }
    }
    
}
