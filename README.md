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
apt install docker.io -y
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
- В поле ENABLE_PROPOSER меняем с false на true
- В поле L1_PROPOSER_PRIVATE_KEY вставляем ваш приватный ключ Metamask.
- В поле L2_SUGGESTED_FEE_RECIPIENT вставляем свой адрес Metamask.
- В поле PROVER_ENDPOINTS вставляем данное значение http://prover.dojonode.xyz/

После того как все сделали в терминале кликаем CTRL+O, затем Enter, затем CTRL+X, чтобы выйти.

Обратите внимания на то, чтобы у Вас был эфир в сети Sepolia Testnet.

Запускаем ноду
```
docker compose up -d
```

Команды:

Запуск ноды
```
docker compose up -d
```

Остановить ноду
```
docker compose down
```

Рестарт
```
docker compose down && docker compose up -d
```

Обновить ноду
```
git pull origin main && docker compose pull
```

Удалить ноду
```
docker compose down -v
```

Просмотр всех логов
```
docker compose logs -f
```

Просмотр l2_execution_engine логов
```
docker compose logs -f l2_execution_engine
```

Просмотр taiko_client_driver логов
```
docker compose logs -f taiko_client_driver
```

Просмотр taiko_client_proposer логов
```
docker compose logs -f taiko_client_proposer
```

Просмотр taiko_client_prover_relayer логов
```
docker compose logs -f taiko_client_prover_relayer
```

Просмотр zkevm_chain_prover_rpcd логов
```
docker compose logs -f zkevm_chain_prover_rpcd
```
