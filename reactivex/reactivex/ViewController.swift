//
//  ViewController.swift
//  reactivex
//
//  Created by Hye Sung Park on 11/14/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  var counter: Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.counter += 1
      self.countLabel.text = "\(self.counter)"
    }
  }
  
  @IBOutlet var imageView : UIImageView!
  @IBOutlet var countLabel: UILabel!
  
  
  @IBAction func onLoadImage(_ sender: Any) {
    imageView.image = nil
    
    _ = rxswiftLoadImage(from: LARGE_IMAGE_URL)
      .observe(on: MainScheduler.instance)
      .subscribe({ result in
        switch result {
        case let .next(image):
          self.imageView.image = image
        case let .error(err):
          print(err.localizedDescription)
        case .completed:
          break
        }
      })
    
  }
  
  @IBAction func onCancel(_ sender: Any) {
    let _ = Demo()
  }
  
  func rxswiftLoadImage(from imageUrl: String) -> Observable<UIImage?> {
    return Observable.create { seal in
      asyncLoadImage(from: imageUrl) { image in
        seal.onNext(image)
        seal.onCompleted()
      }
      return Disposables.create()
    }
  }
}

