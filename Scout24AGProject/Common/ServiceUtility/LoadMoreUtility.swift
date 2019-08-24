//
//  LoadMoreUtility.swift
//  Scout24AGProject
//
//  Created by Zulqurnain on 01/19/19.

import UIKit
class LoadMoreUtility: NSObject {
    
    class func loadMore(scrollView: UIScrollView, totalCount: Int, currentOffset: Int, isServiceRunning: Bool, isScrollViewBegin: Bool, completion: @escaping (Int, Int) -> Void) {
        
        let offset_: CGPoint = scrollView.contentOffset
        let bounds: CGRect = scrollView.bounds
        let size: CGSize = scrollView.contentSize
        let inset: UIEdgeInsets = scrollView.contentInset
        let y: CGFloat = offset_.y + bounds.size.height - inset.bottom
        let h: CGFloat = size.height
        let reload_distance: CGFloat = 12
        
        if y > h + reload_distance && !isServiceRunning && isScrollViewBegin {
            if currentOffset <= totalCount && currentOffset > 0 {
                completion(totalCount,currentOffset)
            }
        }
    }
    
}
