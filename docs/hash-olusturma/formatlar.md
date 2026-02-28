# Formatlar

<details>

<summary>Payment</summary>

```csharp
$"{hashKey}###{paymentId}###{merchantUniqueCode}###{amount.ToString()}###{installment}";
```

</details>

<details>

<summary>BulkPayment</summary>

```csharp
$"{hashKey}###{bulkPaymentId}###{merchantUniqueCode}";
```

</details>

<details>

<summary>LinkPayment</summary>

```csharp
$"{hashKey}###{linkQrId}###{paymentId}###{trackId}###{orderId}###{amount.ToString()}";
```

</details>

<details>

<summary>CheckoutPayment</summary>

```csharp
$"{hashKey}###{checkoutId}###{paymentId}###{uniqueCode}###{amount.ToString()}";
```

</details>

<details>

<summary>Payout</summary>

```csharp
$"{hashKey}###{payoutId}###{merchantGroupCode}###{merchantUniqueCode}###{amount.ToString()}";
```

</details>

<details>

<summary>Apm</summary>

```csharp
$"{hashKey}###{apmId}###{merchantUniqueCode}###{amount.ToString()}";
```

</details>

<details>

<summary>Paywatch</summary>

```csharp
$"{hashKey}###{paymentId}###{merchantUniqueCode}"
```

</details>

<details>

<summary>Recurring</summary>

```csharp
$"{hashKey}###{paymentId}###{subscriptionMerchantCode}###{subscriptionCode}"
```

</details>

<details>

<summary>PhysicalPos</summary>

```csharp
$"{key}###{paymentRequestId}###{merchantUniqueCode}###{amount}"
```

</details>
