//
//  Game1VC.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class Game1VC: UIViewController {
    private var circle: UIView!
    private let radiusOfCircle: CGFloat = 50
    
    override func loadView() {
        let custonView = UIView(frame: UIScreen.main.bounds)
        view = custonView
        view.backgroundColor = UIColor(red: 0.7373, green: 0.6745, blue: 0, alpha: 1.0)
        circle = UIView()
        circle.backgroundColor = .red
        circle.frame = CGRect(x: view.bounds.midX - radiusOfCircle , y: view.bounds.midY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2 )
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.masksToBounds = true
        view.addSubview(circle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workWithNavCtrl()
        workWithRecognizers()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotatedPhone), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotatedPhone() {
        if UIDevice.current.orientation.isLandscape || UIDevice.current.orientation.isPortrait {
            circle.isHidden = true
        }
    }
    
    private func workWithNavCtrl() {
        self.navigationItem.title = "Game 1"
        self.navigationController?.navigationBar.backgroundColor = .systemBrown
    }
    
    private func workWithRecognizers() {
        let tapRecognizerVC = UITapGestureRecognizer(target: self, action: #selector(tapVC))
        let tapRecognizerCircle = UITapGestureRecognizer(target: self, action: #selector(tapCircle))
        circle.addGestureRecognizer(tapRecognizerCircle)
        view.addGestureRecognizer(tapRecognizerVC)
    }
    
    @objc private func tapVC(sender: UITapGestureRecognizer) {
        let currentTap = sender.location(in: view)
        if circle.isHidden {
            putCircleOnView(point: currentTap)
        }
    }
    
    @objc private func tapCircle(sender: UITapGestureRecognizer) {
        circle.isHidden = true
    }

    private func putCircleOnView(point: CGPoint) {
        let minYforCircle = (self.navigationController?.navigationBar.frame.maxY)!
        var setX: CGFloat!
        var setY: CGFloat!
        
        if point.x <= view.safeAreaLayoutGuide.layoutFrame.minX + radiusOfCircle {
            setX = view.bounds.minX + radiusOfCircle
        } else if point.x >= view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle {
            setX = view.safeAreaLayoutGuide.layoutFrame.maxX - radiusOfCircle
        } else {
            setX = point.x
        }
        
        if point.y <= minYforCircle + radiusOfCircle {
            setY = minYforCircle + radiusOfCircle
        } else if point.y >= view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle {
            setY = view.safeAreaLayoutGuide.layoutFrame.maxY - radiusOfCircle
        } else {
            setY = point.y
        }
        
        circle.frame = CGRect(x: setX - radiusOfCircle, y: setY - radiusOfCircle, width: radiusOfCircle * 2, height: radiusOfCircle * 2)
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.masksToBounds = true
        circle.isHidden = false
    }
    
}
