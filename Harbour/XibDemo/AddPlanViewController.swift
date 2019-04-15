//
//  AddPlanViewController.swift
//  Demo111
//
//  Created by 刘欢 on 2018/5/8.
//  Copyright © 2018年 刘欢. All rights reserved.
//

import UIKit

class AddPlanViewController: UIViewController {
    
    fileprivate static let ImageInnerTitleCellID = String(describing: FDXibCell<ImageInnerTitleView>.self)
    
//    fileprivate let cellData = [("成长计划名称: 成长计划名称", UIImage(named: "矩形11拷贝11")!),
//                                ("成长计划名称: 成长计划名称", UIImage(named: "矩形11拷贝10")!),
//                                ("成长计划名称: 成长计划名称", UIImage(named: "矩形11拷贝11")!),
//                                ]
    @IBOutlet weak var contentViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak fileprivate var contentView: UIView!
    @IBOutlet weak fileprivate var iconLabelView: IconLabelView!
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    
    @IBOutlet weak fileprivate var slantingButtonView: SlantingButtonView!
    
    @IBAction func dismissButtonClick(_ sender: UIButton) {
        dismissAddPlanViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.perform(#selector(modifyConstant), with: nil, afterDelay: 0.2)
        configUI()
        configAction()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if (IS_IPHONE_X||IS_IPHONE_XS||IS_IPHONE_XR||IS_IPHONE_XS_Max) == true {
            self.contentViewConstraint.constant = 630
            self.contentView.setNeedsLayout()
        }else if is_iPhone6Plus == true{
            self.contentViewConstraint.constant = 540
            self.contentView.setNeedsLayout()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 点击外部隐藏
        guard let point = touches.first?.location(in: view) else {
            return
        }
        guard !self.contentView.frame.contains(point) else {
            return
        }
        dismissAddPlanViewController()
    }
}

// MARK: - Action
extension AddPlanViewController {
    func dismissAddPlanViewController() {
        view.backgroundColor = UIColor.clear
        self.dismiss(animated: true, completion: nil)
    }
    
    func configAction() {
        slantingButtonView.buttonTapAction = { type in
            switch type {
             /*
                 
                 /growthPlan/#/createPlan/userId/client/createType/planType/planId/purview
                 client：     安卓端：android / 苹果端：ios
                 createType： createSmPlan
                 planType：   create 新建计划
                 planId：     新建时为null
                 purview：    personal个人/company注册
                 我的
                 http://www.beixiang123.com/growthPlan/#/mine/:userId
                 精英成长路径
                 http://www.beixiang123.com/growthPlan/#/find/:userId
                 创建计划
                 http://www.beixiang123.com/growthPlan/#/createPlan/:userId/createSmPlan/create/:purview
                 purview：personal个人
                 company注册
                 */
                
            case .left:
                Print("left")
                let userId = BXKeyChain.get("userId")
                let viewController1 = BXCreatMyPlanViewController()
             
                viewController1.url = H5_BaseproductandTestUrl.baseUrl + "growthPlan/#/createPlan/" + "\(userId)"+"/ios"+"/createSmPlan/create/null/personal"
                self.navigationController?.pushViewController(viewController1, animated: true)
            case .right:
                 Print("right")
                let userId = BXKeyChain.get("userId")
                let viewController1 = BXCreatMyPlanViewController()
                
                viewController1.url = H5_BaseproductandTestUrl.baseUrl + "growthPlan/#/createPlan/" + "\(userId)"+"/ios"+"/createSmPlan/create/null/company"
                 self.navigationController?.pushViewController(viewController1, animated: true)
            }
        }
    }
}


// MARK: - config
extension AddPlanViewController {
    fileprivate func configUI() {
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.register(FDXibCell<ImageInnerTitleView>.self, forCellReuseIdentifier: AddPlanViewController.ImageInnerTitleCellID)
        
        // iconLabelView
        iconLabelView.configUI(image: UIImage(named: "推荐模版")!, title: "六商成长推荐")
        
        // slantingButtonView
        let left = (backImage: UIImage(named: "圆角矩形3")!,
                    IconImage: UIImage(named: "个人")!,
                    title: "创建我的计划",
                    subtitle: "规划自己")
        let right = (backImage: UIImage(named: "圆角矩形3拷贝")!,
                     IconImage: UIImage(named: "个人拷贝2")!,
                     title: "创建注册计划",
                     subtitle: "提升业绩")
        slantingButtonView.configUI(left: left, right: right)
    }
}

// MARK: - DataSource
//extension AddPlanViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellData.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: AddPlanViewController.ImageInnerTitleCellID) as! FDXibCell<ImageInnerTitleView>
//        cell.selectionStyle = .none
//        cell.myContentView.configUI(title: cellData[indexPath.row].0, image: cellData[indexPath.row].1)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.bounds.height / CGFloat(cellData.count)
//    }
//}
