import requests

# Define the URL of your Wisecow app
url = "https://wisecow.local"

try:
    response = requests.get(url, verify=False)  # verify=False ignores self-signed TLS
    if response.status_code == 200:
        print(f"[UP] {url} is reachable")
    else:
        print(f"[DOWN] {url} returned status code {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"[DOWN] {url} is not reachable. Error: {e}")
