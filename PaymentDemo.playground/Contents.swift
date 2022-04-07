protocol PaymentGateway {
    func recievePayment(amount: Double)
    //read only calculated property
    var totalPayment: Double {get}
}

class PayPal : PaymentGateway {
    private var total = 0.0
    
    func recievePayment(amount: Double) {
        total += amount
    }
    
    var totalPayment: Double {
        print("Total payment recieved via PayPal = \(total)")
        return total
    }
}

class Stripe : PaymentGateway {
    private var total = 0.0
    
    func recievePayment(amount: Double) {
        total += amount
    }
    
    var totalPayment: Double {
        print("Total payment recieved via Stripe = \(total)")
        return total
    }
}


let paypal = PayPal()
paypal.recievePayment(amount: 100)
paypal.recievePayment(amount: 200)
paypal.recievePayment(amount: 499)

let stripe = Stripe()
stripe.recievePayment(amount: 5.99)
stripe.recievePayment(amount: 25)
stripe.recievePayment(amount: 9.99)

var paymentGateway: [PaymentGateway] = [paypal, stripe]


// third-party class, that doesn't conform to PaymentGateway
class AmazonPayments {
    var payment = 0.0
    
    func paid(value: Double, currency: String) {
        payment += value
        print("Paid \(currency) \(value) via Amazon Payments")
    }
    
    func fulfilledTransactions() -> Double {
        return payment
    }
}

//let amazonPayments = AmazonPayments()
//amazonPayments.paid(value: 120, currency: "USD")
//amazonPayments.paid(value: 74.99, currency: "USD")

// we can't add AmazonPayments class to our Payment Gateway // so we will use Aadapter DP

//class AmazonPaymentsAdapter: PaymentGateway {
//    func recievePayment(amount: Double) {
//        amazonPayments.paid(value: amount, currency: "USD")
//    }
//
//    var totalPayment: Double {
//        let total = amazonPayments.payment
//        print("Total payments recieved via Amazon Payment = \(total)")
//        return total
//    }
//}
//
//let amazonPaymentsAdapter = AmazonPaymentsAdapter()
//amazonPaymentsAdapter.recievePayment(amount: 120)
//amazonPaymentsAdapter.recievePayment(amount: 44.99)
//
//paymentGateway.append(amazonPaymentsAdapter)
//
//
//var total = 0.0
//for gateway in paymentGateway {
//    total += gateway.totalPayment
//}
//print(total)


// also we can use extension in the class without adding new Adapter class


extension AmazonPayments: PaymentGateway {
    
    func recievePayment(amount: Double) {
        amazonPayments.paid(value: amount, currency: "USD")
    }

    var totalPayment: Double {
        let total = amazonPayments.payment
        print("Total payments recieved via Amazon Payment = \(total)")
        return total
    }
}

let amazonPayments = AmazonPayments()
amazonPayments.paid(value: 120, currency: "USD")
amazonPayments.paid(value: 74.99, currency: "USD")

paymentGateway.append(amazonPayments)


var total = 0.0
for gateway in paymentGateway {
    total += gateway.totalPayment
}
print(total)
