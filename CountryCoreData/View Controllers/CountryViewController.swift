//
//  CountryViewController.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImageSVGCoder

class CountryViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var countryArr : CountryData? = [] {
        didSet{
            DispatchQueue.main.async {
                self.tblView.reloadData()
                //update UI like table reloading
            }
        }
    }
    var fetchedCArray = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        countryApiCall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchedCArray = DatabaseManager.shared.fetchCountry()
        tblView.reloadData()
    }
    
    func countryApiCall(){
        ApiHandler.sharedInstance.getApiForCountry { (countrydata, error) in
            self.countryArr = countrydata
            for item in self.countryArr!{
                self.saveCountryIntoDB(name: item.name, population: Int32(item.population), capital: item.capital, flag: item.flag)
            }
        }
    }
    
    func saveCountryIntoDB(name: String, population: Int32, capital: String, flag: String){
        DatabaseManager.shared.addCountry(name: name, population: population, capital: capital, flag: flag)
    }
    
}

extension CountryViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "Cell") as? CountryTableViewCell
        
        
        let obj = fetchedCArray[indexPath.row]
        cell?.nameLbl.text = "\(obj.name!)"
        cell?.capitalLbl.text = "Capital: \(obj.capital!)"
        cell?.populationLbl.text = "Population: \(obj.population)"
        
        DispatchQueue.main.async {
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
            //let SVGImageSize = CGSize(width: 40, height: 40)
            let urlImage = URL(string: obj.flag!)
            cell?.imgView?.sd_setImage(with: urlImage, placeholderImage: nil, options: [], context: nil)
        }
        
//        DispatchQueue.main.async {
//            cell?.imgView?.loadImageUsingCacheWithURLString(obj.flag!, placeHolder: UIImage(named: "placeholder"))
//        }
        
        
        return cell!
    }
    
}
