#!/usr/bin/env python
import pika
import time

time.sleep(20)
queue='mtech'
rabbit_host='rabbitmq'

connection = pika.BlockingConnection(pika.ConnectionParameters(host=rabbit_host))
channel = connection.channel()


channel.queue_declare(queue=queue)

def callback(ch, method, properties, body):
    print(" [x] Recebido: %r" % body)

channel.basic_consume(callback,
                      queue=queue,
                      no_ack=True)

print(' [*] Aguardando mensagens. Pressione CTRL+C para sair')
channel.start_consuming()
