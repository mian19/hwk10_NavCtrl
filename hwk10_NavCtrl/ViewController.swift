//
//  ViewController.swift
//  hwk10_NavCtrl
//
//  Created by Kyzu on 30.01.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = "To Main"
    }

    @IBAction func onGame1Button(_ sender: UIButton) {
        transitToVC(nextVC: Game1VC.self)
    }
    
    @IBAction func onGame2Button(_ sender: UIButton) {
        transitToVC(nextVC: Game2VC.self)
    }
    
    @IBAction func onGame3Button(_ sender: UIButton) {
        transitToVC(nextVC: Game3VC.self)
    }
    
    private func transitToVC<T: UIViewController>(nextVC: T.Type) {
        let storyboard = UIStoryboard(name: "\(nextVC)", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! T
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

