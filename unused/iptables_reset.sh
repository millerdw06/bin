#!/bin/bash
echo 1
if !( iptables -F ); then
  exit 1
fi
echo 2
if !( iptables -X ); then
  exit 1
fi
echo 3
if !( iptables -t nat -F ); then
  exit 1
fi
echo 4
if !( iptables -t nat -X ); then
  exit 1
fi
echo 5
if !( iptables -t mangle -F ); then
  exit 1
fi
echo 6
if !( iptables -t mangle -X ); then
  exit 1
fi
echo 7
if !( iptables -t raw -F ); then
  exit 1
fi
echo 8
if !( iptables -t raw -X ); then
  exit 1
fi
echo 9
if !( iptables -t security -F ); then
  exit 1
fi
echo 10
if !( iptables -t security -X ); then
  exit 1
fi
echo 11
if !( iptables -P INPUT ACCEPT ); then
  exit 1
fi
echo 12
if !( iptables -P FOWARD ACCEPT ); then
  exit 1
fi
echo 13
if !( iptables -P OUTPUT ACCEPT ); then
  exit 1
fi
echo all good

