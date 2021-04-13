# Networking Foundations


## Protocols

---

**KEYWORDS**<br/>
**Protocol** - a set of rules governing the exchange or transmission of data for network communication.

---

Some examples of protocols developed.

To address different aspects of network communication.
- structure of a message
- flow and order of all the messages
- message transfer rules

To address the same aspect of network communication but in a different way or for a specific use-case.
- discussion between student and teacher
- discussion between friends
- discussion presentation at conference

## Layer System

Trying to understand the overall system of communication can be dauting. Instead
we can break it up into layers ie group of protocols. By focusing on these
layers we can target our understanding.

Two of the most popular model which describe computer network communication are
**OSI(Open Systems Interconnection) vs TCP/IP(Transmission Control Protocol/Internet Protocol)**

> insert image here

The difference between the models are that they each take a different approach describing network communitication. The **IP** model divides the layers in terms of the scope of communications within each layer (within a local network, between networks, etc). The **OSI** model divides the layers in terms of the functions that each layer provides (physical addressing, logical addressing and routing, encryption, compression, etc).

Groups of protocols work in a layered system. Protocols at one layer provide services to the layer above.

## Data Encapsulation
Just like in Ruby, data is "encapsulated" to prevent access from outside of the encapsulated object.

### Protocol Data Units(PDU)
This is accomplished by using Protocol Data Units(PDU) ie a block of data
transfered over a network. Different protocols or layers call PDU by different
names.
- At the Link/ Data Link layer, for example, a PDU is known as a frame.
- At the Internet/ Network layer it is known as a packet.
- At the Transport layer, it is known as a segment (TCP) or datagram (UDP).

A PDU consist of a
- header
- a data payload
- footer/trailer, not always

### Header and Trailer
The exact structure of the header and/or trailer varies from protocol to
protocol, but their purpose is to provide protocol-specific metadata about
the PDU. For example, an Internet Protocol (IP) packet header would include
fields for the Source IP Address and the Destination IP Address, which would be
used to correctly route the packet.

### Data Payload
The data payload portion of a PDU is simply the data that we want to transport
over the network using a specific protocol at a particular network layer.

The data payload is the key to the way encapsulation is implemented. The entire
PDU from a protocol at one layer is set as the data payload for a protocol at
the layer below. For example, a HTTP Request at the Application layer could be
set as the payload for a TCP segment at the transport layer.

> [models](LS170_Networking_Foundations/network_diagram osi_tcp.odg)

This creates seperations between the protocols at different layers

## Physical Network

### Characteristics of the Physical Network
#### The Elements of Latency
Latency<br/>
-The time it takes for data to get from one point to another in a network.

Propagation Delay
  The amount of time it takes message to travel from the sender to the receiver.

Transmission Delay
  The amount of time it takes to push data onto the link. Think of link as all the wires, cables and routers the data travels.

Processing Delay
  The amount of time it take to process the data b

Queuing Delay
  The ammount of time data is in buffer before the preceeding data is processed

Bandwidth
- The amount of data over set time that gets from point to another in a network.

Last mile latency, the part of the network that transition from public internet acccess from internet provider to you private inhome netework.

Round Trip Time (RTT) time of length for a signal to be sent and respose of signal was sent
