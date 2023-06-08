<p align="center">
  <img height="100" height="auto" src="https://github.com/freshe4qa/taiko/assets/85982863/1e33e2dd-2147-4d18-bede-675c2c3500ed">
</p>

# Taiko Testnet

Official documentation:
>- [Validator setup instructions](https://taiko.xyz/docs/guides)

Explorer:
>- [https://explorer.test.taiko.xyz](https://explorer.test.taiko.xyz)

### Minimum Hardware Requirements
 - 2+ CPUs;
 - 4GB RAM
 - 1TB of storage (SSD or NVME)

## Установка
```
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release    
```

```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```
git clone https://github.com/taikoxyz/simple-taiko-node.git
```

```
cd simple-taiko-node
```

```
cp .env.sample .env
```

Используем Alchemy или любой другой провайдер RPC, берем оттуда Sepolia Testnet: Https, wss 
```
nano .env
```

- В поле L1_ENDPOINT_HTTP вставляем вашу ссылку https
- В поле L1_ENDPOINT_WS вставляем вашу ссылку wss
- В поле ENABLE_PROVER меняем с false на true
- В поле L1_PROVER_PRIVATE_KEY вставляем ваш приватный ключ Metamask.

После того как все сделали в терминале кликаем CTRL+O, затем Enter, затем CTRL+X, чтобы выйти.

Обратите внимания на то, чтобы у Вас был эфир в сети Sepolia Testnet.

Запускаем ноду
```
docker compose up -d
```

Просмотр логов
```
docker compose logs -f
```
