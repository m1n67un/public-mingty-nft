const Mingty = artifacts.require('Mingty');

contract("Mingty", async function(accounts) {
    const [owner] = accounts;

    beforeEach(async function() {
        this.token = await Mingty.new();
    })

    it("publish item", async function() {
        const tokenId = await this.token.publishItem(owner, "http://dev.sample.com/a/b/abc.jpg");

        console.log(tokenId);
    })
})