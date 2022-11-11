//: migrations 디렉토리 앞 붙여지는 숫자대로 실행된다.
const Mingty = artifacts.require("Mingty");

module.exports = function (deployer) {
    deployer.deploy(Mingty);
}