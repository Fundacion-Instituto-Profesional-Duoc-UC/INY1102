# **Tabla de configuración Evaluación Parcial EA2**

 

| **Dispositivo**       | **Interfaz**              | **Dirección IP**           | **Máscara de Subred** | **Puerta de Enlace** |
|-----------------------|--------------------------|----------------------------|------------------------|----------------------|
| **Router**           | GigabitEthernet0/0        | Conectado a Switch1        | N/A                    | N/A                  |
|                       | GigabitEthernet0/0.10     | 192.168.10.1               | 255.255.255.0          | N/A                  |
|                       | GigabitEthernet0/0.20     | 192.168.20.1               | 255.255.255.0          | N/A                  |
| **Switch1**          | Fa0/2                     | Conectado a PC0            | N/A                    | N/A                  |
|                       | Fa0/1                     | Conectado al Server0       | N/A                    | N/A                  |
|                       | GigabitEthernet0/1        | Conectado al Router        | N/A                    | N/A                  |
|                       | GigabitEthernet0/2        | Conectado a Switch2        | N/A                    | N/A                  |
| **Switch2**          | Fa0/1                     | Conectado a PC1            | N/A                    | N/A                  |
|                       | Fa0/2                     | Conectado a PC2            | N/A                    | N/A                  |
|                       | GigabitEthernet0/1        | Conectado a Switch1        | N/A                    | N/A                  |
| **Servidor DHCP**     | Fa0                       | 192.168.10.2               | 255.255.255.0          | 192.168.10.1         |
|                       | Start IP Address         | 192.168.10.50              | 255.255.255.0          | 192.168.10.1         |
| **PC0 (Cliente DHCP)**| FastEthernet0            | Automático (DHCP)          | Automático             | Automático           |
| **PC1 (Manual)**      | FastEthernet0            | 182.168.10.11              | 255.255.255.0          | 192.168.10.1         |
| **PC2 (Manual)**      | FastEthernet0            | 192.168.20.10              | 255.255.255.0          | 192.168.20.1         |


 

# Soluciones para completar el 100% del Packet Tracer 

 

1.- Comandos de consulta y verificación: 

Estado de interfaces: 
show ip interface brief 

 

Tabla de enrutamiento: 
show ip route 

 

Verificación de configuración: 
show running-config 

 

Verificar la conectividad hacia otros dispositivos en la red: 

ping (IP que corresponda) 

 ##

2.- En el router: Habilitar interfaz (up/up): 

enable 

configure terminal 
interface GigaEthernet0/0.10 

no shutdown 

exit 

 
##
3.- En PC1: Corregir IP en la interfaz gráfica 

Verificar la IP asignada al servidor: Ipconfig 

 
##
4.- En PC2: Corregir Puerta de enlace (Defaul Gateway) en la interfaz gráfica 

Verificar el default gateway asignada al servidor: Ipconfig 

 
##
5.- En Server DHCP: Activar servicio DHCP en la interfaz gráfica 

 
##
6.- En PC0 (Cliente DHCP):  Habilitar DHCP en la interfaz gráfica 

ipconfig /release 

ipconfig /renew 