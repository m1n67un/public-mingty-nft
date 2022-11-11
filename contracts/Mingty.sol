pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//: ERC721(NFT: 대체 불가능한 토큰) ->  토큰 하나의 소유자 계정 접보가 있다. (토큰에서 소유권을 증명하겠다.)
//: ERC20(COIN) => 토큰 하나 하나 안에 소유자 정보가 없다 소유자 지갑에 계정 정보가 있다. (지갑에서 소유권을 증명하겠다.)
contract Babkorea is ERC721URIStorage {
    using Counters for Counters.Counter; //: using=> 라이브러리를 사용하는 방법이라고 생각하면 된다.
    Counters.Counter private _tokenIds;

    constructor() ERC721("Mingty", "MGT") {}

    //: web3.js => 이더리움 같은 경우는 이것을 이용해서 자바스크립트에서 스마트 컨트랙트를 이용 public으로 정의된 함수만 자바스크립트에서 이용할 수 있음.
    //: uint256 => 변수타입 중 숫자로 담을 수 있는 최대 크기
    function publishItem(address creator, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment(); // 1

        uint256 newTokenId = _tokenIds.current(); //: 현재 Count 값

        //: 위까지의 설명. 발행될 때마다 1씩 증가하는데 이 해당 숫자를 KEY로 가정갈 예정.
        //: Smart Contracter 공부 하다보면 함수 앞에 '_'가 붙는 경우, 뒤에 internal 이 붙는데 이 경우 java에서의 private와 같다. 외부에서는 이 함수를 사용할 수 없다.
        //: mint => 토큰 발행
        _mint(creator, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        /*: 현재의 NFT는 완벽하지않다. 이유는 블록체인 안에 소유자 정보, 원본 데이터가 모두 들어있어야 의미가 있는 것이지만,
            기존의 NFT는 특정 웹서버, 특정 레파지토리에 원본이 있는 것이고, 블록체인에는 원본이 어디에 있는지 주소값 URI값만 들어있다.
            만약, 원본데이터(그림)을 변경하게되면, NFT가 무너진다. 원본의 있는 위치값만 가지고 있다.
            그래서 블록체인 안에 원본데이터를 넣는 시도를 국제적으로 많이하고 있다. 방법은 존재한다.
            예시, 책에 있는 모든 내용을 블록체인 안에 넣었다.
            블록체인이 블록 하나의 저장할 수 있는 사이즈가 한정적이다. 
            고화질 사진, 그림 같은 경우는 사이즈가 크기 때문에 블록을 쪼개서 나눠서 담아야 한다. 가지고 올 때도 힘들어진다.
            한계가 있기 떄문에 시도가 이루어지고 있지만, 부족한게 많다
            대체 방안으로 IPFS가 있는데, 블록체인은 아니고, 파일을 이미지 영상 파일들을 쪼개서 나눠서 저장 관리를 한다. 블록체인처럼 하고 있지만, 블록체인처럼 하지 않는다.
        */
        return newTokenId;
    }
}