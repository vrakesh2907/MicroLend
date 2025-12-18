# MicroLend DeFi Protocol

A minimal **collateralized lending DeFi protocol** built with **Solidity, Hardhat, Next.js, and Ethers v6**, deployed on **Polygon Amoy (EVM-compatible)**.

This project demonstrates the **core mechanics of DeFi lending**:

* Supplying ERC20 tokens as collateral
* Borrowing the chain’s native asset (MATIC)
* Enforcing collateral factors
* Handling protocol-side liquidity
* Full wallet-based frontend interaction

---

## 🚀 Features

### Smart Contracts (Solidity)

* ERC20 collateral token (TestToken)
* Lending protocol (MicroLend)
* Supply collateral
* Borrow MATIC against collateral
* Collateral factor enforcement (50%)
* Repay borrowed MATIC
* Withdraw collateral
* Deployed on Polygon Amoy

### Frontend (Next.js + Ethers)

* MetaMask wallet connection
* Automatic network check (Polygon Amoy)
* ERC20 approve + supply flow
* Borrow flow with on-chain validation
* Live on-chain balance updates
* Proper transaction UX (loading states, errors)

---

## 🧠 Architecture Overview

```
User Wallet (MetaMask)
   │
   ├── Approves ERC20 collateral
   ├── Supplies collateral to protocol
   ├── Borrows MATIC (if liquidity available)
   │
MicroLend Contract (Polygon Amoy)
   │
   ├── Stores supplied collateral
   ├── Tracks borrowed balances
   ├── Enforces collateral factor
   └── Sends native asset to borrower
```

---

## 📦 Tech Stack

* **Solidity** (0.8.x)
* **Hardhat** (deployment & testing)
* **Next.js (App Router)**
* **Ethers.js v6**
* **MetaMask**
* **Polygon Amoy Testnet**

---

## 📄 Deployed Contracts (Polygon Amoy)

> Replace addresses if redeployed

```text
TestToken   : 0xad892E74D1DC30965EA80A2ABd309bbD0c618ed0
MicroLend  : 0xE9839B2a44E62de7136D2d2E8e29163d47A91083
```

Explorer:

* [https://amoy.polygonscan.com/](https://amoy.polygonscan.com/)

---

## ⚙️ How the Protocol Works

### 1️⃣ Supply Collateral

* Users approve ERC20 tokens
* Tokens are transferred into the protocol
* Collateral is tracked per user

### 2️⃣ Borrow MATIC

* Max borrow = `supplied × 50%`
* Borrowing succeeds **only if the protocol has liquidity**
* Native MATIC is transferred from contract to user

### 3️⃣ Repay

* Users repay borrowed MATIC
* Borrowed balance is reduced

### 4️⃣ Withdraw

* Allowed only if borrowed balance is zero
* ERC20 collateral is returned

---

## ⚠️ Important Note on Liquidity

Borrowing depends on **protocol-side liquidity**, not the user’s wallet balance.

If the contract does not hold enough MATIC:

* Borrow transactions revert
* This behavior is intentional and mirrors real DeFi protocols

On testnets, liquidity is limited by faucet availability.

---

## 🧪 Local Development

### Contracts

```bash
cd contracts
npm install
npx hardhat compile
npx hardhat run scripts/deploy.js --network amoy
```

### Frontend

```bash
cd frontend
npm install
npm run dev
```

Open: [http://localhost:3000](http://localhost:3000)

---

## 🖼️ Demo Flow

1. Connect MetaMask
2. Switch to Polygon Amoy
3. Approve ERC20 collateral
4. Supply collateral
5. (If liquidity available) Borrow MATIC
6. Observe live balance updates

---

## 🎯 Learning Outcomes

This project demonstrates:

* Real DeFi lending mechanics
* ERC20 approval patterns
* Protocol liquidity constraints
* On-chain state synchronization
* Production-style Web3 UX flows

---

## 📌 Disclaimer

This project is for **educational and demonstration purposes only**.
Not audited. Do not use in production.

---

## 👤 Author

**Rakesh Vishwakarma**

* Full Stack / Web3 Engineer
* Next.js • Solidity • EVM • DeFi

---

## ✅ Status

**Project Complete** ✔️

Smart contracts, frontend integration, and DeFi flows are fully implemented and functional on testnet.
