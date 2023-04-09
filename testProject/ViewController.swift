//
//  ViewController.swift
//  testProject
//
//  Created by 김라영 on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selfiView: UIImageView!
    @IBOutlet weak var selfiChangeButton: UIButton!
    //UIImagePickerController - 사진, 앨범, 동영상 등을 위한 system interfaces를 관리하는 viewController
    let imagePickerController = UIImagePickerController()
    let lightGrayColor = UIColor(named: "lightgray100")
    let blueColor = UIColor(named: "1005blue")
    let placeHolderGray = UIColor(named: "placeHolderGray")
    let redColor = UIColor(named: "920red400")
    
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var nickNameCnt: UILabel!
    
    @IBOutlet weak var simpleProfile: UITextField!
    @IBOutlet weak var simpleProfileCnt: UILabel!
    
    @IBOutlet weak var introTextView: UITextView!
    @IBOutlet weak var introTextViewCnt: UILabel!
    let textViewPlaceHolder = "다른 사람에게 나를 소개할 수 있도록 \n자신의 활동을 자세하게 적어주세요."

    @IBOutlet weak var webSiteView: UIView!
    @IBOutlet weak var webSiteAddBtn: UIButton!
    @IBOutlet weak var webSiteAddBtnBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var websiteStackView: UIStackView!
    @IBOutlet weak var firstWebSiteTextField: UITextField!
    let noMoreAddLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        selfiView.layer.cornerRadius = selfiView.frame.height / 2
        self.selfiChangeButton.layer.cornerRadius = selfiChangeButton.layer.frame.height / 2
        
        self.imagePickerController.delegate = self
        self.nickName.delegate = self
        self.simpleProfile.delegate = self
        self.introTextView.delegate = self
        
        nickNameAndSimpleProfileViewSetting()
        introTextViewSetting()
        
        //self -> 셀력터 Action메소드를 가지고 있는 객체(그러니까 해당 objc메소드가 정의되어 있는 뷰컨)
        //action -> 어떤 액션을 취하는가(함수를 넣어주면 됨) selector을 이용해서 함수를 선택할 수 있다
        //for -> 버튼의 이벤트
        webSiteAddBtn.addTarget(self, action: #selector(websiteAddBtnClicked(_:)), for: .touchUpInside)
    }
    
    //selfiChangeBtn을 누르면 카메라, 앨범 actionsheet 나옴
    @IBAction func selfiChangeBtnDidTap(_ sender: Any) {
        //UIAlertController -> 메시지 창 자체를 담당한다
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //UIAlertAction -> 메시지 창에 들어갈 버튼을 구현
        
        //var camera: (action) -> () = {(매개변수를 받는 부분) in 실행내용}
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera()}
        let albumAction = UIAlertAction(title: "앨범", style: .default) { (action) in self.openAlbum()}
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        //handler -> 버튼을 클릭했을 때 실행되는 구문
        
        alert.addAction(cameraAction)
        alert.addAction(albumAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func nickNameAndSimpleProfileViewSetting() {
        nickName.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        nickName.leftViewMode = .always  //leftView를 보여줄지 안보여줄지(기본값은 보이지 않는 모드)
        nickName.layer.borderWidth = 1
        nickName.layer.borderColor = lightGrayColor?.cgColor
        nickName.layer.cornerRadius = 8
        
        simpleProfile.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        simpleProfile.leftViewMode = .always
        simpleProfile.layer.borderWidth = 1
        simpleProfile.layer.borderColor = lightGrayColor?.cgColor
        simpleProfile.layer.cornerRadius = 8
    }
    
    //자기소개 textView세팅
    private func introTextViewSetting() {
        introTextView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        introTextView.text = textViewPlaceHolder  //placeHolder처럼 보이게 만들기
        introTextView.layer.borderWidth = 1
        introTextView.layer.borderColor = lightGrayColor?.cgColor
        introTextView.layer.cornerRadius = 9
        introTextView.textColor = placeHolderGray
    }
    
    private func webSiteTextFieldSetting() {
        firstWebSiteTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        firstWebSiteTextField.leftViewMode = .always
    }
    
    
    @IBAction func nickNameFocus(_ sender: Any) {
        nickName.layer.borderColor = blueColor?.cgColor
    }
    
    @IBAction func nickNameChanging(_ sender: Any) {
        nickNameCnt.text = "\(nickName.text!.count) / 20"
        nickName.textColor = .black
    }
    
    @IBAction func nickNameEndChanged(_ sender: Any) {
        nickName.layer.borderColor = lightGrayColor?.cgColor
    }
    
    @IBAction func simpleProfileFocus(_ sender: Any) {
        simpleProfile.layer.borderColor = blueColor?.cgColor
    }
    
    @IBAction func simpleProfileChanging(_ sender: Any) {
        simpleProfileCnt.text = "\(simpleProfile.text!.count) / 30"
        simpleProfile.textColor = .black
    }
    
    @IBAction func simpleProfileEndChanged(_ sender: Any) {
        simpleProfile.layer.borderColor = lightGrayColor?.cgColor
    }
    
    //sender를 UIButton이라고 하면 어떤 버튼인지 받을 수 있다
    @objc func websiteAddBtnClicked(_ sender: UIButton) {
        #warning("TODO : - 웹사이트 스택뷰에 아이템 추가")
        
        noMoreAddLabel.text = "웹사이트는 3개까지 추가 가능합니다"
        noMoreAddLabel.font = UIFont.systemFont(ofSize: 12)
        noMoreAddLabel.textColor = redColor
        noMoreAddLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if websiteStackView.arrangedSubviews.count == 3 {
            webSiteAddBtnBottomAnchor.constant = 30 //constant 변경
   
            //3개인데 웹사이트 추가 버튼을 누르면 textField 추가
            webSiteView.addSubview(noMoreAddLabel)
            
            NSLayoutConstraint.activate([noMoreAddLabel.leftAnchor.constraint(equalTo: self.webSiteView.leftAnchor, constant: 10), noMoreAddLabel.topAnchor.constraint(equalTo: self.webSiteAddBtn.bottomAnchor, constant: 10)])
        } else {
            let subWebSiteTextField = UITextField()
            subWebSiteTextField.placeholder = "SNS 또는 홈페이지를 연결해주세요."
            subWebSiteTextField.borderStyle = .roundedRect
            subWebSiteTextField.font = .systemFont(ofSize: 14)
            subWebSiteTextField.translatesAutoresizingMaskIntoConstraints = false
            
            let trashButton = UIButton(type: .system)//사용자가 터치를 했다는 느낌주기
            trashButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
            trashButton.tintColor = lightGrayColor
            trashButton.layer.borderWidth = 1
            trashButton.layer.borderColor = lightGrayColor?.cgColor
            trashButton.layer.cornerRadius = 5
            trashButton.translatesAutoresizingMaskIntoConstraints = false
            //stackView기준으로 버튼의 오른쪽에 padding을 주는 방법 -> 1. 버튼 자체에 패딩값주기 2. horizental stackview에 패딩값 죽;
            //3. 버튼의 크기는 해당 프로젝트에서 프로필 사진 크기 정도는 되는게 좋다 -> 왜냐하면 손가락의 크기가 그정도니까
            NSLayoutConstraint.activate([  //아래 constraint들을 한번에 active하겠다
                trashButton.widthAnchor.constraint(equalToConstant: 40),
                trashButton.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            let addWebSiteHstackView = UIStackView(arrangedSubviews: [subWebSiteTextField, trashButton])
            addWebSiteHstackView.axis = .horizontal
            addWebSiteHstackView.spacing = 10
    //        addWebSiteHstackView.isLayoutMarginsRelativeArrangement = true
    //        addWebSiteHstackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            
            self.websiteStackView.addArrangedSubview(addWebSiteHstackView)
            
            trashButton.addTarget(self, action: #selector(trashBtnClicked(_:)), for: .touchUpInside)
        }
    }
    
    //trahsButton 모양 눌렀을 때
    @objc func trashBtnClicked(_ sender: UIButton) {
        websiteStackView.removeArrangedSubview(sender.superview!)
        sender.superview!.removeFromSuperview()
        webSiteAddBtnBottomAnchor.constant = 10
        //웹 사이트는 세개까지만 추가 가능합니다 label이 있는지 없는지 확인
        if noMoreAddLabel.isDescendant(of: webSiteView) {
            noMoreAddLabel.removeFromSuperview()
        }
    }
    
}

//ImagePickerController 프로토콜 채택 & 사진이 선택, 취소 될때 어떤 행동을 취할 것인지 정의
extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    //actionsheet에서 앨범버튼을 눌렀을 때 실행될 구문
    func openAlbum() {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: false, completion: nil)
    }
    
    //actionsheet에서 카메라버튼을 눌렀을 때 실행될 구문
    func openCamera() {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: false, completion: nil)
    }
    
    //imagePickerController -> 사진을 선택하거나 찍은 사진을 사용한다고 하면
    //didFinshPickingMediaWithInfo -> 사진을 pick한 후 처리할 내용을 이 메소드에 추가호출(즉, 여기서 사진 선택한 후에 어떻게 할건지를 정의)
    //info --> 선택한 미디어의 정보가 담겨져 있다(info는 Dictionary로 구성)
    //UIImagePickerController.InfoKey -> 사용자가 선택한 매체(카메라, 앨범 등)한 정보를 딕셔너리로 편집해서 이 딕셔너리화 된 사용자 매체에 대한 정보를 얻기위해서 사용한다
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //선택한 미디어의 정보가 info에 담겨져 있으몰 info에서 UIImagePickerController.InfoKey.originalImage를 키로 값을 가져옴
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selfiView.image = image //선택한 이미지 selfiview에 넣어주기
            dismiss(animated: true, completion: nil) //dismiss 안해주면 이미지 pick한 후에 imagePickerController가 사라지지 않는다
        }
    }
}
 
//NSRange -> 연속적인 객체를 담고있는 객체에서 하나의 원소에 대한 설명을 위해 사용되는 구조체
extension ViewController: UITextFieldDelegate {
    //textField(_shouldChangeCharacterIn:replacementString) -> text를 변경할지에 대한 delegate요청 메소드(변경할거라면 -> return이 true, 변경하지 않는다면 return이 false)
    //range -> 변경되는 문자열에 관련된 NsRange의 값(수정될 범위 정보)?
    //string -> 변경문자열?
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        guard nickName.text!.count < 20 else { return false }  //20글자를 넘으면 textfieldd의 내용을 변경하지 않는다는 것을 의미한다
        
        guard simpleProfile.text!.count < 30 else { return false }
        return true
    }
}


extension ViewController: UITextViewDelegate {
    //지정된 텍스트 뷰의 편집이 시작할 때를 알려주는 메소드
    func textViewDidBeginEditing(_ textView: UITextView) {
        if introTextView.text == textViewPlaceHolder {
            introTextView.text = ""
            introTextView.textColor = .black
        }
        introTextView.layer.borderColor = blueColor?.cgColor
    }
    
    //지정된 텍스트 뷰의 편집이 끝나는 시기를 알려주는 메소드
    func textViewDidEndEditing(_ textView: UITextView) {
        //trimmingCharacters(in:) -> 문자열 왼쪽, 오른쪽 끝에 있는 character를 삭제하는 인스턴스 메소드
        //trimmingCharacters(in: .whitespacesAndNewlines) -> 양쪽 끝 space와 NewLines제거(앞뒤공백과 줄바꿈 제거)
        //여기서 in -> input파라미터 즉, trimmingCharacters함수 안에서 변수로 사용됨
        //in: .withespacesAndNewlines -> in이라는 변수에 whitespacesAndNeslines를 값으로 넘겨준다는 것을 의미한다
        if introTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            introTextView.text = textViewPlaceHolder
            introTextView.textColor = placeHolderGray
        }
        introTextView.layer.borderColor = lightGrayColor?.cgColor
    }
    
    //textView를 변경하면 true 변경하지 않으면 false를 호출한다ㄹ
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        print("textView가 어떤건지 확인: \(textView.text)") //즉, textView의 text는 현재 textView에 들어와있는 문자를 의미한다
        print("range확인: \(range), text확인: \(text)")
        //즉, 종합해보면 textView.text -> 원래 들어와있는 text, range -> textView에 있는 글자의 범위, text -> 새롭게 들어온 문자
        //range{6,2} -> 선택된 시작 위치, 선택된 글자의 길이
        //새로 들어온 글자의 범위를 구하기
        print("range의 length 확인: \(range.length)") //range.length는 선택된 글자의 길이
        //textView.text.count -> 원래 text에 있던 글자, range.length -> 선택된 글자의 길이 , text.count -> 새로 들어온 글자의 개수
        
        let currentText = introTextView.text as NSString
//        guard let stringRange = Range(range, in: currentText) else { return false }
//        Instance method 'replacingCharacters(in:with:)' requires that 'NSRange' (aka '_NSRange') conform to 'RangeExpression' stringRange는 rangeExpression으로 변경해주기 위해서 필요함
//        print(stringRange)
        let changedText = currentText.replacingCharacters(in: range, with: text)
        introTextViewCnt.text = "\(changedText.count) / 1000"
        return true
    }
}
