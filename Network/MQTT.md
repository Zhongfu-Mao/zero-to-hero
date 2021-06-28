## 基础

* MQTT:MQ Telemetry Transport
* A machine-to-machine(M2M) and IoT connectivity protocol

### 组成

* publisher
* subscribers
* server(MQTT3.1.1以前叫broker)

![img](https://miro.medium.com/max/5080/1*7MwXy5N4rx4mAxZ2KZrwJQ.png)

### topic

* a named logical channel
* UTF-8
* 类似Unix的文件系统
* 通配符
  * `+`:single-level
  * `#`:multi-level,只能用在最后

### payload

* the data for a message

### QoS levels

* The QoS(Quality of Service) level is the agreement between a sender and a receiver of a message about the guarantees of actually delivering the message.
* 发布和订阅的级别可以不同
* `0`:At most once delivery
* `1`:At least once delivery
* `2`:Exactly once delivery

## Mosquitto

### 安装

[Download | Eclipse Mosquitto](http://www.mosquitto.org/download/)

#### Linux

#### Mac

```bash
brew install mosquitto

brew service start mosquitto # 后台服务
mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf # 直接启动
```

#### Windows

```powershell
netstat -an | findstr 1883 # 检测是否开启
```

### 创建发布者

```bash
mosquitto_pub -V mqttv311 -t <topic> -m <message> -d 
# -d for debug
```

### 创建订阅者

```bash
mosquitto_sub -V mqttv311 -t <topic> -d -q 1 
# -q for QoS level
```

## MQTT.fx

[Download – Softblade](https://softblade.de/en/download-2/)

## Working with Python

### 安装

```bash
pip install paho-mqtt
```

### 订阅

```python
import paho.mqtt.client as mqtt

def on_connect(client, userdata, flags, rc): 
    # rc: the data that come along with the connection acknowledgement from the server
    print(f"Result from connect: {mqtt.connack_string(rc)}")    
    client.subscribe("sensors/altimeter/1", qos=1)                    
   
def on_subscribe(client, userdata, message_id, granted_qos):    
    print(f"I've subscribed with QoS:{granted_qos[0]}")
    
def on_message(client, userdata, msg):    
    print(f"Message received. Topic: {msg.topic}. Payload: {msg.payload}")
    
    
if __name__ == "__main__":    
    client = mqtt.Client(protocol=mqtt.MQTTv311)    
    client.on_connect = on_connect    
    client.on_subscribe = on_subscribe    
    client.on_message = on_message
    client.connect(host="server.xxx.com", port=1883, keepalive=60)    
    client.loop_forever()
```

### 发布

```python
import paho.mqtt.client as mqtt

topic = "sensors/altimeter/1"

if __name__ == "__main__":        
    client = mqtt.Client(protocol=mqtt.MQTTv311)
    client.connect(host="s.com", port=1883)              
    client.connect(host="server.xxx.com", port=1883)              
    client.publish(topic=topic, payload="300 feet")
```

