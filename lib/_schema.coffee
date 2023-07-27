@_schema = (_objName, _addData) ->
  rslt = {}
  # add 될 데이터가 있다면 return 시에 extend 해서 반환한다.
  addData = _addData or {}

  switch _objName
    when 'communityComment' #각종 댓글
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        content: ''
        user_id: ''

    when 'communityUser'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        community_id: ''
        user_id: ''

    when 'community'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        user_id: ""
        title: ''
        describeShort: ''   # 간략 소개
        describeLong: ''    # 상세 소개
        email: ''         # 커뮤니티용 이메일
#      joinType: ''      # 즉시 / 승인 (초기 즉시 승인 형태)
        img_ids: []       # 심볼 이미지
        banner_ids: []
        category: [] # 커뮤니티유형. _define.categories 참조 ['Art', 'Collectable', 'Entertainment', 'Movie', 'Game', 'Sport', 'Etc']
        viewed: 0   # 조회수. 디테일 화면이 불릴 때 count++ 되어야 함.
        liked: 0    # 좋아요
        sns: {}      # 작가용 sns. facebook: '', twitter: '', discord: '', youtube: '', instagram: ''.
        link: ''           # 홈페이지 등 링크 주소
        agree:
          community: false
    when 'eventProduct'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        user_id:''  #이벤트 주최자
        event_id: ''       # required
        title: ''
        content: ''
        author_name:''
        category: []
        img_ids: []  #실제 업로드 작품들.
        viewed: 0   # 조회수. 디테일 화면이 불릴 때 count++ 되어야 함.
        liked: 0    # 좋아요

    when 'event' # 컨텐트: 전시/프로그램/이벤트/메타존
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        user_id: ''
        startAt: new Date()     #예정 / 진행중 / 종료 판단
        endAt: new Date()       #예정 / 진행중 / 종료 판단
        place: ''        #주최장소
        organizer: ''     #관
        title: ''
        content: ''
        type: ''    #_define.eventType.random()
        subType: ''   #if 전시 then ['기획', '특별', '상시'].random()
        status: ''    #if 전시 then ['진행중', '예정', '종료'].random()
        img_ids: []     #프로필 이미지 필요 시 사용
        file_ids: []    #배너 필요시 사용
        category: [] # _define.categories 참조 ['Art', 'Collectable', 'Entertainment', 'Movie', 'Game', 'Sport', 'Etc']
        viewed: 0   # 조회수. 디테일 화면이 불릴 때 count++ 되어야 함.
        liked: 0    # 좋아요
        link: ''    #메타버스 공간 이동 링크
        isApproved:false

    when 'product' #작품
      rslt =
        createdAt: new Date()
        updatedAt: new Date()
        user_id: ''       # required
        title: ''
        content: ''
        img_ids: []  #대표 이미지들.
        file_ids: []  #실제 업로드 작품들.
        category: [] # _define.categories 참조 ['Art', 'Collectable', 'Entertainment', 'Movie', 'Game', 'Sport', 'Etc']
        viewed: 0   # 조회수. 디테일 화면이 불릴 때 count++ 되어야 함.
        liked: 0    # 좋아요
        nft:null #클라이언터에서 민트 버튼 클릭 시 null-> 발행예정 번호로 업데이트
          # meta:
          #   description: '' 
          #   external_url: ''
          #   image: ''
          #   name: ''
          #   attributes: []
          # nft_num:''
          # author: null # 최초 작품 등록 시 set
          # owner: '' #기본적으로 디비id를 사용하나 외부에서 이동시 유정정보가 없음으로 walletaddress 병행 사용
          # owner_address:''
          # isSell:false
          # inProgress:false
          # price:''

    when 'profile' #user.profile
      rslt =
        updatedAt: new Date()   #createdAt은 default로 존재
        name: ''
        nickName: ''  # unique name
        description: ''
        img_ids: [] # profile img.
        banner_ids: [] # banner img
        characterType:0
        customCharacterUrl:''
        mobile: '' #휴대폰번호
        sns: {} #url:'', facebook: '', twitter: '', discord: '', youtube: '', instagram: ''.
        coins:0
        deviceToken:''
        sceneUploadCount:0
        agree:
          marketing: false #크리버스 마케팅 수신동의
          receiveInfo: false #정보발송 수신동의
          author:false #크리버스 작가 활동 약관 동의
          receivingUserMessage:false
          revealYourProfile:false
        wallet_address:''
        author: null # 아래 작가 정보 필요 시 set (최초 작품 등록 시 set)
          # category: [] # _define.categories 참조 ['Art', 'Collectable', 'Entertainment', 'Movie', 'Game', 'Sport', 'Etc']

    when 'Likes'
      rslt =
        target_id:''
        user_id:''

    when 'Notification'
      rslt =
        createdAt: new Date()
        updatedAt: new Date()   #createdAt은 default로 존재
        type:'' #notice,alert 공지와 알림으로 
        title: ''
        content: ''
        checkUser:[] #읽은 유저 _id 기록?

    else
      throw new Error '### Data Schema Not found'
  return _.extend rslt, addData
