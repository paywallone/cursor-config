# Yetkilendirme

## TempToken

<mark style="color:green;">`POST`</mark> `{{Base Adres}}/api/paywall/temptoken`&#x20;

{% hint style="info" %}
Önemli: **TempToken** servisini kullanabilmeniz için 'Header' alanında '**apikeypublic**' ve '**apiclientpublic**' parametrelerini göndermeniz gerekmektedir.\
\
[<mark style="color:green;">**PaymentAPI Adresi**</mark>](https://developer.paywall.one/ortam)
{% endhint %}

<table><thead><tr><th width="188">Parametre</th><th width="79">Tip</th><th width="107">Zorunlu</th><th width="403">Açıklama</th></tr></thead><tbody><tr><td>apikeypublic</td><td>string</td><td>Evet</td><td>Üye işyeri panelinden temin etmiş olduğunuz Public Key.</td></tr><tr><td>apiclientpublic</td><td>string</td><td>Evet</td><td>Üye işyeri panelinden temin etmiş olduğunuz Public Client.</td></tr></tbody></table>

#### Servise gönderilmesi gereken parametreler şu şekildedir:

<table><thead><tr><th width="244">Parametre</th><th width="157">Tip</th><th width="131">Zorunlu</th><th width="336">Açıklama</th></tr></thead><tbody><tr><td><pre><code>ClientCardSave
</code></pre></td><td>boolean</td><td>Evet</td><td>Token, client tarafta kart saklama için kullanılacak mı?</td></tr><tr><td><pre><code>ThreeDSession
</code></pre></td><td>boolean</td><td>Evet</td><td>Token, client tarafta 3D işlem yapmak için kullanılacak mı?</td></tr><tr><td><pre><code>ExpiryMin
</code></pre></td><td>int</td><td>Evet</td><td>Token, kaç dakika geçerli olacak?<br><br><mark style="color:blue;"><strong>0 ile 30 arasında tanım yapılabilir</strong></mark></td></tr></tbody></table>

**Servise gönderilecek örnek&#x20;**<mark style="color:green;">**JSON**</mark>**&#x20;ve&#x20;**<mark style="color:green;">**örnek kodlar**</mark>**&#x20;aşağıdaki gibidir.**

{% tabs %}
{% tab title="JSON" %}
{% code lineNumbers="true" %}

```json5
{
    "ClientCardSave": true,
    "ThreeDSession": false,
    "ExpiryMin": 30
}
```

{% endcode %}
{% endtab %}

{% tab title="C#" %}

```csharp
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
    static readonly HttpClient client = new HttpClient();

    static async Task Main()
    {
        var url = "{{MemberBaseAddress}}/api/paywall/member";
        var data = new
        {
            IsSubMerchant = true,
            MemberType = 1,
            MemberExternalId = "111aa11135552244413",
            MemberName = "Intranet Technology",
            MemberTitle = "Intranet Technology Yazılım A.S",
            MemberTaxOffice = "Besiktas",
            MemberTaxNumber = "4651176935",
            MemberIdentityNumber = "11111111110",
            MemberEmail = "member@paywall.one",
            MemberPhone = "5554443322",
            MemberAddress = "test adresi",
            ContactName = "Member Name",
            ContactLastname = "Lastname",
            BankAccounts = new[]
            {
                new {
                    CurrencyId = 1,
                    Title = "Ünvan",
                    Iban = "TR370006400012345678987654"
                }
            },
            ValueDate = new
            {
                CalculationType = 1,
                CalculationValue = 10,
                Commission = 10   
            }
        };

        var json = JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");
        content.Headers.Add("apikeypublic", "%PUBLICKEY%");
        content.Headers.Add("apiclientpublic", "%PUBLICCLIENT%");

        var response = await client.PostAsync(url, content);

        if (response.IsSuccessStatusCode)
        {
            var responseBody = await response.Content.ReadAsStringAsync();
            dynamic result = JsonConvert.DeserializeObject(responseBody);

            Console.WriteLine($"ErrorCode: {result.ErrorCode}");
            Console.WriteLine($"Result: {result.Result}");
            Console.WriteLine($"Message: {result.Message}");

            if (result.Body != null)
            {
                dynamic body = result.Body;
                Console.WriteLine($"Id: {body.Id}");
                Console.WriteLine($"IsSubMerchant: {body.IsSubMerchant}");
                Console.WriteLine($"MemberType: {body.MemberType}");
                Console.WriteLine($"MemberExternalId: {body.MemberExternalId}");
                Console.WriteLine($"MemberName: {body.MemberName}");
                Console.WriteLine($"MemberTitle: {body.MemberTitle}");
                Console.WriteLine($"MemberTaxOffice: {body.MemberTaxOffice}");
                Console.WriteLine($"MemberTaxNumber: {body.MemberTaxNumber}");
                Console.WriteLine($"MemberEmail: {body.MemberEmail}");
                Console.WriteLine($"MemberPhone: {body.MemberPhone}");
                Console.WriteLine($"MemberAddress: {body.MemberAddress}");
                Console.WriteLine($"ContactName: {body.ContactName}");
                Console.WriteLine($"ContactLastname: {body.ContactLastname}");
                Console.WriteLine($"InsertDateTime: {body.InsertDateTime}");
            }
        }
    }
}
```

{% endtab %}

{% tab title="GO" %}

```go
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type RequestData struct {
	IsSubMerchant      bool   `json:"IsSubMerchant"`
	MemberType         int    `json:"MemberType"`
	MemberExternalId   string `json:"MemberExternalId"`
	MemberName         string `json:"MemberName"`
	MemberTitle        string `json:"MemberTitle"`
	MemberTaxOffice    string `json:"MemberTaxOffice"`
	MemberTaxNumber    string `json:"MemberTaxNumber"`
	MemberIdentityNumber string `json:"MemberIdentityNumber"`
	MemberEmail        string `json:"MemberEmail"`
	MemberPhone        string `json:"MemberPhone"`
	MemberAddress      string `json:"MemberAddress"`
	ContactName        string `json:"ContactName"`
	ContactLastname    string `json:"ContactLastname"`
	BankAccounts       []BankAccount `json:"BankAccounts"`
	ValueDate          ValueDate `json:"ValueDate"`
}

type BankAccount struct {
	CurrencyId int    `json:"CurrencyId"`
	Title      string `json:"Title"`
	Iban       string `json:"Iban"`
}

type ValueDate struct {
	CalculationType  int `json:"CalculationType"`
	CalculationValue int `json:"CalculationValue"`
	Commission       int `json:"Commission"`
}

type ResponseData struct {
	ErrorCode int    `json:"ErrorCode"`
	Result    bool   `json:"Result"`
	Message   string `json:"Message"`
	Body      BodyData `json:"Body"`
}

type BodyData struct {
	Id                 int    `json:"Id"`
	IsSubMerchant      bool   `json:"IsSubMerchant"`
	MemberType         int    `json:"MemberType"`
	MemberExternalId   string `json:"MemberExternalId"`
	MemberName         string `json:"MemberName"`
	MemberTitle        string `json:"MemberTitle"`
	MemberTaxOffice    string `json:"MemberTaxOffice"`
	MemberTaxNumber    string `json:"MemberTaxNumber"`
	MemberIdentityNumber string `json:"MemberIdentityNumber"`
	MemberEmail        string `json:"MemberEmail"`
	MemberPhone        string `json:"MemberPhone"`
	MemberAddress      string `json:"MemberAddress"`
	ContactName        string `json:"ContactName"`
	ContactLastname    string `json:"ContactLastname"`
	InsertDateTime     string `json:"InsertDateTime"`
}

func main() {
	url := "{{MemberBaseAddress}}/api/paywall/member"
	data := RequestData{
		IsSubMerchant:      true,
		MemberType:         1,
		MemberExternalId:   "111aa11135552244413",
		MemberName:         "Intranet Technology",
		MemberTitle:        "Intranet Technology Yazılım A.S",
		MemberTaxOffice:    "Besiktas",
		MemberTaxNumber:    "4651176935",
		MemberIdentityNumber: "11111111110",
		MemberEmail:        "member@paywall.one",
		MemberPhone:        "5554443322",
		MemberAddress:      "test adresi",
		ContactName:        "Member Name",
		ContactLastname:    "Lastname",
		BankAccounts:       []BankAccount{
			{
				CurrencyId: 1,
				Title:      "Ünvan",
				Iban:       "TR370006400012345678987654",
			},
		},
		ValueDate: ValueDate{
			CalculationType:  1,
			CalculationValue: 10,
			Commission:       10,
		},
	}

	requestBody, _ := json.Marshal(data)

	client := &http.Client{}
	req, _ := http.NewRequest("POST", url, bytes.NewBuffer(requestBody))
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("apikeypublic", "%PUBLICKEY%")
	req.Header.Set("apiclientpublic", "%PUBLICCLIENT%")
	resp, _ := client.Do(req)

	defer resp.Body.Close()

	body, _ := ioutil.ReadAll(resp.Body)

	var responseData ResponseData
	json.Unmarshal(body, &responseData)

	fmt.Println("ErrorCode:", responseData.ErrorCode)
	fmt.Println("Result:", responseData.Result)
	fmt.Println("Message:", responseData.Message)
	fmt.Println("Body.Id:", responseData.Body.Id)
	fmt.Println("Body.IsSubMerchant:", responseData.Body.IsSubMerchant)
	fmt.Println("Body.MemberType:", responseData.Body.MemberType)
	fmt.Println("Body.MemberExternalId:", responseData.Body.MemberExternalId)
	fmt.Println("Body.MemberName:", responseData.Body.MemberName)
	fmt.Println("Body.MemberTitle:", responseData.Body.MemberTitle)
	fmt.Println("Body.MemberTaxOffice:", responseData.Body.MemberTaxOffice)
	fmt.Println("Body.MemberTaxNumber:", responseData.Body.MemberTaxNumber)
	fmt.Println("Body.MemberIdentityNumber:", responseData.Body.MemberIdentityNumber)
	fmt.Println("Body.MemberEmail:", responseData.Body.MemberEmail)
	fmt.Println("Body.MemberPhone:", responseData.Body.MemberPhone)
	fmt.Println("Body.MemberAddress:", responseData.Body.MemberAddress)
	fmt.Println("Body.ContactName:", responseData.Body.ContactName)
	fmt.Println("Body.ContactLastname:", responseData.Body.ContactLastname)
	fmt.Println("Body.InsertDateTime:", responseData.Body.InsertDateTime)
}
```

{% endtab %}

{% tab title="Java" %}

```java
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONObject;

public class Main {

    public static void main(String[] args) {
        try {
            URL url = new URL("{{MemberBaseAddress}}/api/paywall/member");

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("IsSubMerchant", true);
            jsonObject.put("MemberType", 1);
            jsonObject.put("MemberExternalId", "111aa11135552244413");
            jsonObject.put("MemberName", "Intranet Technology");
            jsonObject.put("MemberTitle", "Intranet Technology Yazılım A.S");
            jsonObject.put("MemberTaxOffice", "Besiktas");
            jsonObject.put("MemberTaxNumber", "4651176935");
            jsonObject.put("MemberIdentityNumber", "11111111110");
            jsonObject.put("MemberEmail", "member@paywall.one");
            jsonObject.put("MemberPhone", "5554443322");
            jsonObject.put("MemberAddress", "test adresi");
            jsonObject.put("ContactName", "Member Name");
            jsonObject.put("ContactLastname", "Lastname");

            JSONArray bankAccounts = new JSONArray();
            JSONObject bankAccount = new JSONObject();
            bankAccount.put("CurrencyId", 1);
            bankAccount.put("Title", "Ünvan");
            bankAccount.put("Iban", "TR370006400012345678987654");
            bankAccounts.put(bankAccount);

            jsonObject.put("BankAccounts", bankAccounts);

            JSONObject valueDate = new JSONObject();
            valueDate.put("CalculationType", 1);
            valueDate.put("CalculationValue", 10);
            valueDate.put("Commission", 10);

            jsonObject.put("ValueDate", valueDate);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("apikeypublic", "%PUBLICKEY%")
            conn.setRequestProperty("apiclientpublic", "%PUBLICCLIENT%")

            OutputStream os = conn.getOutputStream();
            os.write(jsonObject.toString().getBytes());
            os.flush();

            if (conn.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
                throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
            }

            Scanner scan = new Scanner(url.openStream());
            String entireResponse = new String();
            while (scan.hasNext())
                entireResponse += scan.nextLine();

            System.out.println("Response : "+entireResponse);

            scan.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

{% endtab %}

{% tab title="PHP" %}

```php
<?php
$url = '{{MemberBaseAddress}}/api/paywall/member';

$header = array(
    'Content-Type: application/json',
    'apikeypublic: %%',
    'apiclientpublic: %%'
);

$data = array(
    'IsSubMerchant' => true,
    'MemberType' => 1,
    'MemberExternalId' => '111aa11135552244413',
    'MemberName' => 'Intranet Technology',
    'MemberTitle' => 'Intranet Technology Yazılım A.S',
    'MemberTaxOffice' => 'Besiktas',
    'MemberTaxNumber' => '4651176935',
    'MemberIdentityNumber' => '11111111110',
    'MemberEmail' => 'member@paywall.one',
    'MemberPhone' => '5554443322',
    'MemberAddress' => 'test adresi',
    'ContactName' => 'Member Name',
    'ContactLastname' => 'Lastname',
    'BankAccounts' => array(
        array(
            'CurrencyId' => 1,
            'Title' => 'Ünvan',
            'Iban' => 'TR370006400012345678987654'
        )
    ),
    'ValueDate' => array(
        'CalculationType' => 1,
        'CalculationValue' => 10,
        'Commission' => 10
    )
);

$context = stream_context_create(array(
    'http' => array(
        'method' => 'POST',
        'header' => $header,
        'content' => json_encode($data),
    )
));

$result = file_get_contents($url, false, $context);
?>
```

{% endtab %}

{% tab title="Python" %}

```python
import requests
import json

url = '{{MemberBaseAddress}}/api/paywall/member'
headers = {
    'Content-Type': 'application/json',
    'apikeypublic': '%%',
    'apiclientpublic': '%%'
}

data = {
    'IsSubMerchant': True,
    'MemberType': 1,
    'MemberExternalId': '111aa11135552244413',
    'MemberName': 'Intranet Technology',
    'MemberTitle': 'Intranet Technology Yazılım A.S',
    'MemberTaxOffice': 'Besiktas',
    'MemberTaxNumber': '4651176935',
    'MemberIdentityNumber': '11111111110',
    'MemberEmail': 'member@paywall.one',
    'MemberPhone': '5554443322',
    'MemberAddress': 'test adresi',
    'ContactName': 'Member Name',
    'ContactLastname': 'Lastname',
    'BankAccounts': [
        {
            'CurrencyId': 1,
            'Title': 'Ünvan',
            'Iban': 'TR370006400012345678987654'
        }
    ],
    'ValueDate': {
        'CalculationType': 1,
        'CalculationValue': 10,
        'Commission': 10   
    }
}

response = requests.post(url, headers=headers, data=json.dumps(data))
print(response.json())
```

{% endtab %}

{% tab title="Ruby" %}

```ruby
require 'uri'
require 'net/http'
require 'json'

url = URI("{{MemberBaseAddress}}/api/paywall/member")

http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["apikeypublic"] = '%%'
request["apiclientpublic"] = '%%'
request.body = JSON.dump({
  "IsSubMerchant" => true,
  "MemberType" => 1,
  "MemberExternalId" => '111aa11135552244413',
  "MemberName" => 'Intranet Technology',
  "MemberTitle" => 'Intranet Technology Yazılım A.S',
  "MemberTaxOffice" => 'Besiktas',
  "MemberTaxNumber" => '4651176935',
  "MemberIdentityNumber" => '11111111110',
  "MemberEmail" => 'member@paywall.one',
  "MemberPhone" => '5554443322',
  "MemberAddress" => 'test adresi',
  "ContactName" => 'Member Name',
  "ContactLastname" => 'Lastname',
  "BankAccounts" => [
    {
      "CurrencyId" => 1,
      "Title" => 'Ünvan',
      "Iban" => 'TR370006400012345678987654'
    }
  ],
  "ValueDate" => {
    "CalculationType" => 1,
    "CalculationValue" => 10,
    "Commission" => 10
  }
})

response = http.request(request)
puts response.read_body
```

{% endtab %}

{% tab title="TypeScript" %}

```typescript
import axios from 'axios';

const url = '{{MemberBaseAddress}}/api/paywall/member';
const headers = {
  'Content-Type': 'application/json',
  'apikeypublic': '%%',
  'apiclientpublic': '%%'
};

const data = {
  'IsSubMerchant': true,
  'MemberType': 1,
  'MemberExternalId': '111aa11135552244413',
  'MemberName': 'Intranet Technology',
  'MemberTitle': 'Intranet Technology Yazılım A.S',
  'MemberTaxOffice': 'Besiktas',
  'MemberTaxNumber': '4651176935',
  'MemberIdentityNumber': '11111111110',
  'MemberEmail': 'member@paywall.one',
  'MemberPhone': '5554443322',
  'MemberAddress': 'test adresi',
  'ContactName': 'Member Name',
  'ContactLastname': 'Lastname',
  'BankAccounts': [
    {
      'CurrencyId': 1,
      'Title': 'Ünvan',
      'Iban': 'TR370006400012345678987654'
    }
  ],
  'ValueDate': {
    'CalculationType': 1,
    'CalculationValue': 10,
    'Commission': 10
  }
};

axios.post(url, data, { headers })
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error(error);
  });
```

{% endtab %}

{% tab title="Curl" %}

```sh
curl --location --request POST '{{MemberBaseAddress}}/api/paywall/member' \
--header 'Content-Type: application/json' \
--header 'apikeypublic: %%' \
--header 'apiclientpublic: %%' \
--data-raw '{
    "IsSubMerchant": true,
    "MemberType": 1,
    "MemberExternalId": "111aa11135552244413",
    "MemberName": "Intranet Technology",
    "MemberTitle": "Intranet Technology Yazılım A.S",
    "MemberTaxOffice": "Besiktas",
    "MemberTaxNumber": "4651176935",
    "MemberIdentityNumber": "11111111110",
    "MemberEmail": "member@paywall.one",
    "MemberPhone": "5554443322",
    "MemberAddress": "test adresi",
    "ContactName": "Member Name",
    "ContactLastname": "Lastname",
    "BankAccounts": [
        {
            "CurrencyId": 1,
            "Title": "Ünvan",
            "Iban": "TR370006400012345678987654"
        }
    ],
    "ValueDate": {
        "CalculationType": 1,
        "CalculationValue": 10,
        "Commission": 10
    }
}'
```

{% endtab %}
{% endtabs %}

Servisten dönen parametreler şu şekildedir:

<table><thead><tr><th width="189">Parametre</th><th width="100.33333333333331">Tip</th><th>Açıklama</th></tr></thead><tbody><tr><td>ErrorCode</td><td>int</td><td>Hata kodu. İşlem başarılı ise '0' değerini döner.</td></tr><tr><td>Result</td><td>bool</td><td>True ya da false değeri döner. İşlem başarılı iste 'true' değerini döner.</td></tr><tr><td>Message</td><td>string</td><td>İşlem hatalıysa, bu hataya dair belirtilen mesajdır, locale parametresine göre dil desteği sunar.</td></tr><tr><td>Body</td><td>nesne</td><td>İşlem detay bilgileri</td></tr></tbody></table>

{% tabs %}
{% tab title="JSON" %}
{% code lineNumbers="true" %}

```json
{
    "ErrorCodeType": 1,
    "ErrorMessage": null,
    "ErrorCode": 0,
    "Result": true,
    "Message": "",
    "Body": {
        "TempTokenId": 14533994,
        "Token": "22ae3b5a-8eb0-41cc-88c7-219e25b95441",
        "ExpiryDateTime": "2024-06-13T22:25:08.0404774+03:00",
        "Scope": {
            "ClientCardSave": true,
            "ThreeDSession": false
        }
    }
}
```

{% endcode %}
{% endtab %}
{% endtabs %}
