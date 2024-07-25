;; Define the contract
(define-data-var contract-owner principal tx-sender)

;; Define a map to store balances
(define-map balances principal uint)

;; Define public functions

;; Function to deposit tokens
(define-public (deposit (amount uint))
  (let ((sender tx-sender))
    (if (> amount u0)
        (begin
          (try! (stx-transfer? amount sender (as-contract tx-sender)))
          (map-set balances sender (+ (default-to u0 (map-get? balances sender)) amount))
          (ok true))
        (err u0))))

;; Function to withdraw tokens
(define-public (withdraw (amount uint))
  (let ((sender tx-sender)
        (balance (default-to u0 (map-get? balances sender))))
    (if (and (> amount u0) (<= amount balance))
        (begin
          (try! (as-contract (stx-transfer? amount tx-sender sender)))
          (map-set balances sender (- balance amount))
          (ok true))
        (err u1))))

;; Function to transfer tokens between users
(define-public (transfer (recipient principal) (amount uint))
  (let ((sender tx-sender)
        (sender-balance (default-to u0 (map-get? balances sender))))
    (if (and (> amount u0) (<= amount sender-balance))
        (begin
          (map-set balances sender (- sender-balance amount))
          (map-set balances recipient (+ (default-to u0 (map-get? balances recipient)) amount))
          (ok true))
        (err u2))))

;; Read-only function to get balance
(define-read-only (get-balance (user principal))
  (default-to u0 (map-get? balances user)))

;; Contract owner functions

;; Function to change contract owner
(define-public (change-owner (new-owner principal))
  (if (is-eq tx-sender (var-get contract-owner))
      (begin
        (var-set contract-owner new-owner)
        (ok true))
      (err u3)))