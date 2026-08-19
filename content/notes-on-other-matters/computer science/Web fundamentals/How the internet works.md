# Overview
The internet is not the world wide web (www). The web is the way that data, web pages, services, documents are arranged, accessed and addressed. But all of that sits on top of the hardware that is the internet which allows many networks to talk to each other.

# A simple network
When you have two computers that need to communicate you have to somehow link them, either physically (Ethernet cable) or wirelessly (with wifi or bluetooth systems). When you connect them you will have a so-called network. Your network is not limited by two computers, you can connect as many computers as you want. The problem is that the more computers you need to connect, resources you will have to use to connect them will increment by a lot and really fast. For example, in order to have a (physical) network of 10 computers we will need 45 cables with nine plugs per computer. This will look like a complete graph ($k_10$).

![[k_10.png]]

Considering each node represents a computer.

So to solve this problem each network is going to have a **network swicth** (switch for short) which has only one job: making sure that the messages sent from a given computer arrive only at their target destination.

Adding the switch to the system allows the computers to need only one plug just to communicate with the switch and then letting him handle the message.
![[star_graph.png]]
Now to send a message from computer A to computer B, the computer A sends the message to the switch, which in turn forwards the message to computer B.

# Networks of networks
Of course a single switch can not scale as far as connecting hundred or even billions of computers so what we can do is to connect multiple switches (at the end a switch is just a computer) together so we can form a networks of networks.

![[tree_graph.png]]

One of the many problem of this is that the more switches a packet has to go through, the longer it takes to reach its destination. Also if you have a tree of switches you may be risking to disconnect a large portion of devices due to a single switch failure. For this reason each local network is kept as small as possible, and then we can connect these local networks using a separate device called **router**. A router is computer that knows how to forward messages between networks.
The **modem** comes into scene when we need a physical way to connect all these routers together, as we took advantage of the infrastructure of the telephone network (which existed prior to the internet) and to connect our network to this structure we use the modem. The modem (short for modulator-demodulator) is a device that converts digital data into signals that can travel over an analog transmission medium and then converts received signals back into digital data.
Now to send messages from our network to the network we want to reach we will connect to an Internet Service Provider (**ISP**). An ISP is a company that manages some special routers that are linked together and can also access other ISPs' routers. 


--
<!-- <iframe  -->
<!--   src=""  -->
<!--   width="100%"  -->
<!--   height="700px"  -->
<!--   style="border: 1px solid #303446; border-radius: 8px;" -->
<!--   allowfullscreen> -->
<!-- </iframe> -->
--
