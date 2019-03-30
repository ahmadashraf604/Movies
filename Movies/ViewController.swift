//
//  ViewController.swift
//  Movies
//
//  Created by ashraf on 3/30/19.
//  Copyright © 2019 ashraf. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let strURL = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity&api_key=e07070a3952fcf18a91b6d1aaf196f8c"
        
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
//                let resJson = JSON(responseObject.result.value!)
//                success(resJson)
                print(responseObject)
            }
//            if responseObject.result.isFailure {
//                let error : NSError = responseObject.result.error!
//                failure(error)
//            }
            
            
        }
    }


}

