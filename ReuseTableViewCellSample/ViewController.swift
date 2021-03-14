import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        // 1.プロパティに値がセットされたら
        didSet {
            // 2.再利用するセルを登録して
            tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
            // 3.tableViewのdataSourceにselfをセットしてデータを供給する
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 4.セルの数
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function + "\(indexPath.row)")
        // 5.セルの生成、または再利用
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") else { return UITableViewCell() }
        cell.textLabel?.text = String(indexPath.row)
        if indexPath.row > 10 {
            cell.backgroundColor = .yellow
        }
        return cell
    }
}

class MyTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // 6.セルの生成
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(#function)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        // 7.セルが再利用される時に呼ばれる
        super.prepareForReuse()
        print(#function)
    }
}

