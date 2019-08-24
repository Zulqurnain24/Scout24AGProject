//
//  ImageUtility.swift
//  Scout24AGProject
//
//  ImageUtility.swift
//
//  Created by Zulqurnain on 01/19/19.

import UIKit
import Alamofire
import AlamofireImage

class ImageUtility: NSObject {
    
    static let shared = ImageUtility()
    private override init() {}
    
    var cache: NSCache = NSCache<NSString, UIImage>()
    
    func downloadImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: imageUrl as NSString) {
            completion(image)
            return
        }
        guard let encodedUrlString = imageUrl.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else {
            print("Image URL Percent Encoding failed for: \(imageUrl)")
            completion(nil)
            return
        }
        Alamofire.request(encodedUrlString).responseData { response in
            guard let data = response.data else { return }
            if let image: UIImage = UIImage(data: data, scale: 1.0) {
                self.cache.setObject(image, forKey: imageUrl as NSString)
                completion(image)
            } else {
                print("Image Download failed for: \(encodedUrlString)")
                completion(nil)
            }
        }
    }

}
