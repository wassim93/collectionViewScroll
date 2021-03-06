override func viewDidLoad() {
    super.viewDidLoad()

    startTimer()
}



func startTimer() {

    let timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
}


@objc func scrollAutomatically(_ timer1: Timer) {

    if let coll  = collectionView {
        for cell in coll.visibleCells {
            let indexPath: IndexPath? = coll.indexPath(for: cell)
            if ((indexPath?.row)! < datasource.count - 1){
                let indexPath1: IndexPath?
                indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
            }
            else{
                let indexPath1: IndexPath?
                indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
            }

        }
    }
}
