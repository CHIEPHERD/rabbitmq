function InstallRabbitMq {
  echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
  wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add
  apt-get update
  apt-get install --force-yes -y rabbitmq-server
}

function SetupRabbitMq {
  rabbitmq-plugins enable rabbitmq_management
  rabbitmq-plugins enable rabbitmq_web_mqtt

  rabbitmqctl add_user root root
  rabbitmqctl set_user_tags root administrator
  rabbitmqctl set_permissions -p / root ".*" ".*" ".*"
}

echo 'Install RabbitMQ'; InstallRabbitMq
echo 'Setup RabbitMQ'; SetupRabbitMq
