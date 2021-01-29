//
//  ViewController.swift
//  swift_tutorial_table2
//
//  Created by 早川マイケル on 2021/01/29.
//

import UIKit

// UITableViewDelegate: tableViewを追加したときのお決まり
// UITableViewDataSource: tableViewを追加したときのお決まり
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // テーブルビュー
    @IBOutlet weak var tableView: UITableView!

    // 入力欄
    @IBOutlet weak var textField: UITextField!

    // セルごとの投稿文字
    var textArray = [String]()
    
    // セルごとの画像
    var imageArray = ["1","2","3","4","5"]
    
    // 一番最初に呼ばれる関数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableViewを追加した時のお決まり
        tableView.delegate = self
        tableView.dataSource = self
    }
 
    // セルの総数(リロード時に呼ばれる)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }

    // セクションの総数(リロード時に呼ばれる)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの高さを返す(リロード時に呼ばれる)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 563
    }

    // セルが構築される時に呼ばれるタグ(リロード時に呼ばれる)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルの初期設定
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // ImageViewを取得
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        // Labelを取得
        let label = cell.contentView.viewWithTag(2) as! UILabel

        // テキストを設定
        label.text = textArray[indexPath.row]
        
        // 画像を設定
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        // セル追加
        return cell
    }
    

    // +をタップした時に呼ばれる関数
    @IBAction func tap(_ sender: Any) {
        
        if textArray.count >= 5 || textField.text?.isEmpty == true{
            return
            
        }

        // テキストを追加
        textArray.append(textField.text!)

        // 入力欄を初期化
        textField.text = ""
        
        // テーブルを再描画
        tableView.reloadData()
        
    }

}

