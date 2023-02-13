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

Here are the different customer segments typically used in RFM analysis:
1. Best customers: These are the customers who have made the most recent purchase, have a high frequency of purchases, and have spent a lot of money. They are the most valuable customers and should be prioritized in marketing and retention efforts.
1. Lost Bad customers: These are the customers who have not made a purchase in a long time, have a low frequency of purchases, and have spent very little money. They are not valuable customers and should be removed from the marketing database.
1. Lost customers: These are the customers who have not made a purchase in a long time, but were previously valuable customers. They should be targeted with win-back campaigns to try to re-engage them.
1. Almost lost: These are the customers who have not made a purchase in a relatively short period of time, but have a high frequency of purchases and have spent a lot of money. They are at risk of becoming lost customers and should be targeted with retention efforts.
1. Loyal customers: These are the customers who have made a purchase recently, have a high frequency of purchases, and have spent a lot of money. They are valuable customers and should be prioritized in marketing and retention efforts.
1. Big Spender: These are the customers who have made a purchase recently, but have a low frequency of purchases and have spent a lot of money. They should be targeted with upselling and cross-selling efforts to increase their value.
1 New customers: These are the customers who have made their first purchase recently. They should be targeted with welcome and loyalty programs to encourage repeat business.
1. Hibernating: These are the customers who have not made a purchase in a long time, but have made a high frequency of purchases and have spent a lot of money in the past. They should be targeted with win-back campaigns to try to re-engage them.
1. Potential Loyalist: These are the customers who have made a purchase recently, have a low frequency of purchases, but have spent a lot of money. They should be targeted with loyalty programs to encourage repeat business and increase their value.

By understanding the different customer segments in RFM analysis, businesses can target their marketing and retention efforts more effectively, leading to increased customer loyalty and lifetime value.
