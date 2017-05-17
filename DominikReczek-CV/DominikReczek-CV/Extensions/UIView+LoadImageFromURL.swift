import UIKit
import Alamofire
import AlamofireImage

extension UIView {

    func loadImageFromURL(_ url: String, onCompletion: @escaping (UIImage) -> Void) {
        Alamofire.request(url).responseImage(imageScale: 1.0, inflateResponseImage: false) { response in
            guard let image = response.result.value else { return }
            onCompletion(image)
        }
    }
}
