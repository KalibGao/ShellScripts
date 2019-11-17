# V2ray docs for docker

- config.json
```
{
  "inbounds": [
    {
      "port": 10987, 
      "protocol": "vmess",    
      "settings": {
        "clients": [
          {
            "id": "28aa536e-6343-4568-b0e8-062e3a362d4a", 
            "alterId": 64
          }
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",  
      "settings": {}
    }
  ]
}
```
- for v2ray1
```
sudo docker run -d --name v2ray1 -v /etc/v2ray1:/etc/v2ray -p 10987:10987 v2ray/official v2ray -config=/etc/v2ray/config.json 
```
- for v2ray2 (it requires to create new folder `/etc/v2ray2`)
```
sudo docker run -d --name v2ray1 -v /etc/v2ray2:/etc/v2ray -p 10987:10987 v2ray/official v2ray -config=/etc/v2ray/config.json
```