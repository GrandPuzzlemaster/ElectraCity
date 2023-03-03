const dgram = require('dgram')
const { putVar, getVar } = require('@gd-com/utils')

const server = dgram.createSocket('udp4')

server.on('listening', () => {
  let address = server.address()
  console.log(`UDP Server listening on ${address.address}:${address.port}`)
})
var gifts = 0;
server.on('message', (buf, remote) => {
  let buffer = new Buffer.from(buf)

  const recieve = getVar(buffer)
  console.log('Recieve ' , recieve.value)
  gifts++
  let send = putVar(gifts)

  server.send(send, remote.port, remote.host)
})

server.bind(9091, '127.0.0.1')
