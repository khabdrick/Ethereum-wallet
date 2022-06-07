from brownie import wallet, config, accounts


def deploy_wallet():
    account = accounts.add(config["wallets"]["from_key"])
    wallet = wallet.deploy({"from":account})
    print(f"Contract deployed to {wallet.address}")