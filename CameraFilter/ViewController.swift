//
//  ViewController.swift
//  CameraFilter
//
//  Created by 志村　啓太 on 2021/01/09.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
              let photoCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
            fatalError("Segue destination is not found")
        }
        
        photoCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            
            self?.photoImageView.image = photo
        }).disposed(by: disposeBag)
    }
}

