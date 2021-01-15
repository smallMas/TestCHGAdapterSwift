//
//  TCRXTableViewController.swift
//  TestCHGAdapterSwift
//
//  Created by 燕来秋 on 2021/1/7.
//  https://www.jianshu.com/p/63f1681236fd

import UIKit
import RxCocoa
import RxSwift

//歌曲结构体
struct Music {
    let name: String //歌名
    let singer: String //演唱者
     
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}
 
//实现 CustomStringConvertible 协议，方便输出调试
extension Music: CustomStringConvertible {
    var description: String {
        return "name：\(name) singer：\(singer)"
    }
}
//歌曲列表数据源
struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
    ])
}
class TCRXTableViewController: TCTableViewController,UIScrollViewDelegate {

    //歌曲列表数据源
    let musicListViewModel = MusicListViewModel()
    
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "RX TableView";

        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
        self.view.addSubview(self.tableView)
        
        // 设置数据源
        musicListViewModel.data.bind(to: self.tableView.rx.items(cellIdentifier: "musicCell")) {_,music,cell in
            cell.textLabel?.text = music.name;
            cell.detailTextLabel?.text = music.singer;
        }.disposed(by: disposeBag)
        
        
        // 点击响应
        self.tableView.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
            print("你选中的歌曲信息【\(music)】")
        }).disposed(by: disposeBag)
        
        // 点击响应
        self.tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            print("选中项的indexPath为: \(indexPath)")
            self.tableView.deselectRow(at: indexPath, animated: true)
        }).disposed(by: disposeBag)

        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension TCRXTableViewController: UITableViewDelegate {
    // 设置单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
