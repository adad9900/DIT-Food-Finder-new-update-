//
//  FoodFinderTableViewController.swift
//  DIT Food Finder
//
//  Created by D7702_09 on 2018. 5. 17..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class FoodFinderTableViewController: UITableViewController {
    
    var foodStoreName = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    var foodStoreImage = ["01", "02", "03", "04", "05", "06"]
    var foodStoreAddress = ["부산시 진구 양정동", "부산시 진구 양정동", "부산시 진구 양정동", "부산시 진구 양정동", "부산시 진구 양정동", "부산시 진구 양정동"]
    var foodStoreType = ["돼지국밥", "중국집", "분식점", "중국집", "도시락", "중국집"]
    var foodMenu = ["돼지국밥, 돼지수육, 순대국밥",
                    "짜장면, 짬뽕, 탕수육",
                    "떡볶이, 어묵, 순대",
                    "볶짬면, 양장피, 짬뽕밥",
                    "치킨마요, 돈불와퍼, 제육덮밥, 콤보도시락",
                    "오향장육, 짬뽕, 볶음밥"
                    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "DIT 배달통"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStoreName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as!
            FoodFinderTableViewCell //형 변환 반드시 as!

        // Configure the cell...

        cell.cellImage.image = UIImage(named: foodStoreImage[indexPath.row])
        cell.cellName.text = foodStoreName[indexPath.row]
        cell.cellAddress.text = foodStoreAddress[indexPath.row]
        cell.cellType.text = foodStoreType[indexPath.row]
        
        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(foodStoreName[indexPath.row])
        
        let optionMenu = UIAlertController(title: nil, message: "뭘원하나", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        let callAction = UIAlertAction(title: "전화걸기", style: .default) {
            (action: UIAlertAction) -> Void in
                print("전화걸기 실행")
                let alertMessage = UIAlertController(title: "서비스 구축중", message: "죄송합니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertMessage.addAction(okAction)
            self.present(alertMessage, animated: true)
        }
        
        let checkinAction = UIAlertAction(title: "Check in", style: .default) {
            (action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(checkinAction)
        present(optionMenu, animated : true)
    }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Detail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                DetailViewControllor
                destinationController.celltype = foodStoreType[indexPath.row]
                destinationController.cellimg = foodStoreImage[indexPath.row]
                destinationController.cellName = foodStoreName[indexPath.row]
                destinationController.cellAddress = foodStoreAddress[indexPath.row]
                destinationController.cellMenu = foodMenu[indexPath.row]
            }
        }
    }
 

}
