FROM ubuntu:bionic
RUN apt-get update &&  \
apt-get install curl python3 -y &&  \
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh &&  \
arduino-cli config init && \
sed -i 's/additional_urls: \[\]/additional_urls: \[https:\/\/arduino.esp8266.com\/stable\/package_esp8266com_index.json\]/g' /root/.arduino15/arduino-cli.yaml &&  \
sed -i  's/enabled: true/enabled: false/g' /root/.arduino15/arduino-cli.yaml &&  \
arduino-cli core update-index &&  \
arduino-cli core install esp8266:esp8266 &&  \
arduino-cli sketch new smoke-test &&  \
arduino-cli compile -b esp8266:esp8266:generic /smoke-test/smoke-test.ino
EXPOSE 50051
