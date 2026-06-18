import requests

url = "http://63.34.29.63/api/v1/client/395371"

response = requests.get(url)

data = response.json()

print(data)

ir = (data["largest_loan"]["interest_rt"])*(data["largest_loan"]["payment_freq_mths_no"])/12
balance = data["largest_loan"]["outstanding_amt"]
tn = (data["largest_loan"]["remaining_maturity_no"])/(data["largest_loan"]["payment_freq_mths_no"])

cashflow = (ir * balance * (1 + ir)**tn)/((1 + ir)**tn - 1)

print(ir)
print(balance)
print(tn)
print(int(cashflow))

submite = {
    "client_id" : 395371,
    "challenge_id" : 1,
    "submitter_nm" : "Esteban",
    "result" : cashflow
}

answer = "http://63.34.29.63/api/v1/submit"

r = requests.post(answer, json=submite)