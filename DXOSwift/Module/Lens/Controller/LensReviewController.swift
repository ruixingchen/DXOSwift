//
//  LensReviewController.swift
//  DXOSwift
//
//  Created by ruixingchen on 20/10/2017.
//  Copyright © 2017 ruixingchen. All rights reserved.
//

import UIKit
import Toast_Swift
import MJRefresh

class LensReviewController: GenericReviewListController {

    override func initFunction() {
        super.initFunction()
        self.title = LocalizedString.title_lens_review
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let dbItem:UIBarButtonItem = UIBarButtonItem(title: "DB", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapDBButton))
        self.navigationItem.rightBarButtonItem = dbItem
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    @objc func didTapDBButton(){
        let next:DeviceDatabaseController = DeviceDatabaseController(deviceType: .lens)
        next.view.backgroundColor = UIColor.white
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }

    override func headerRefresh() {
        DXOService.lensReview(page: 1) {[weak self] (inObject, inError) in
            if self == nil {
                return
            }
            self?.headerRefreshHandle(inObject: inObject, inError: inError)
        }
    }

    override func footerRefresh() {
        DXOService.lensReview(page: page+1) {[weak self] (inObject, inError) in
            if self == nil {
                return
            }
            self?.footerRefreshHanle(inObject: inObject, inError: inError)
        }
    }

}
