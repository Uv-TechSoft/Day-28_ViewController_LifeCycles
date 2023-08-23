//
//  ViewController.swift
//  ViewLifeCycle
//
//  Created by Yogesh Patel on 23/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstnameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameField.text = "Yogesh"
        print(#function)
        self.view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
       
        UIView.animate(withDuration: 7) {
            self.view.backgroundColor = .systemCyan
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
//        UIView.animate(withDuration: 10) {
//            self.view.backgroundColor = .blue
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
        firstnameField.text = ""
//        firstnameField.resignFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
//        firstnameField.text = ""
        //Remove Observer, Memory nil karna wo sab , UI Related work!
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
       // firstnameField.resignFirstResponder()
        
        if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
//        if Orientation.isLandscape{
//            view.backgroundColor = .systemCyan
//        }else{
//            view.backgroundColor = .white
//        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
}



struct Orientation {
    // indicate current device is in the LandScape orientation
    static var isLandscape: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isLandscape
                : (UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape)!
        }
    }
    // indicate current device is in the Portrait orientation
    static var isPortrait: Bool {
        get {
            return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isPortrait
                : (UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isPortrait)!
        }
    }
}
