# RFM Segmentation

Hello! My name is Nhien Le, and this is a SQL practice project in my portfolio using a financial transactions dataset with the topic of RFM Segmentation.

### Context
'Telco Card' is the most product in the Telco group (accounting for more than 99% of the total),
and the company wants to segment the customers of Telco Card for the next marketing strategy. Therefore, I would use SQL to categorize the customers using RFM model, and visualize the distribution at the end.

**User segmentation** is the process of separating users into distinct groups, or segments, based on shared characteristics. A company might segment users based on language preferences, product version, geographical region, or user persona. With thoughtful user segmentation, product teams can study how user behaviors vary between segments, then design personalized experiences for each segment.

**RFM segmentation** allows marketers to target specific clusters of customers with communications that are much more relevant for their particular behavior – and thus generate much higher rates of response, plus increased loyalty and customer lifetime value. Like other segmentation methods, RFM segmentation is a powerful way to identify groups of customers for special treatment. RFM stands for recency, frequency and monetary – more about each of these shortly.

---
### Dataset Description
**Paytm** is an Indian multinational financial technology company. It specializes in digital payment system, e-commerce and financial services. Paytm wallet is a secure and RBI (Reserve Bank of India)- approved digital/mobile wallet that provides a myriad of financial features to fulfill every consumer’s payment needs. Paytm wallet can be topped up through UPI (Unified Payments Interface), internet banking, or credit/debit cards. Users can also transfer money from a Paytm wallet to recipient’s bank account or their own Paytm wallet.

Below is a small database of payment transactions from 2019 to 2020 of Paytm Wallet. The database
includes 6 tables:
- fact_transaction: Store information of all types of transactions: Payments, Top-up, Transfers, Withdrawals
- dim_scenario: Detailed description of transaction types
- dim_payment_channel: Detailed description of payment methods
- dim_platform: Detailed description of payment devices
- dim_status: Detailed description of the results of the transaction

---
### Result
<img src="RFM Segmentation.png" alt="RFM Segmentation" width="600"/>
